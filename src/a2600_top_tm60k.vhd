-------------------------------------------------------------------------
-------------------------------------------------------------------------
--  A2600 Top level for Tang Mega 60k
--  2024 Stefan Voss
--  based on the work of many others
--
-------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;

entity A2600_top_tm60k is
  port
  (
    clk_50mhz   : in std_logic; -- XO
    reset       : in std_logic; -- S2 button
    user        : in std_logic; -- S1 button
    leds_n      : out std_logic_vector(1 downto 0);
    io          : in std_logic_vector(4 downto 0);

    -- SPI interface Sipeed M0S Dock external BL616 uC
    m0s         : inout std_logic_vector(4 downto 0);
    --
    tmds_clk_n  : out std_logic;
    tmds_clk_p  : out std_logic;
    tmds_d_n    : out std_logic_vector( 2 downto 0);
    tmds_d_p    : out std_logic_vector( 2 downto 0);
    hpd_en      : out std_logic;
    -- sd interface
    sd_clk      : out std_logic;
    sd_cmd      : inout std_logic;
    sd_dat      : inout std_logic_vector(3 downto 0);

    O_sdram_cs_n : out std_logic;

    ws2812       : out std_logic;

    -- Gamepad Dualshock P1
    ds_clk          : out std_logic;
    ds_mosi         : out std_logic;
    ds_miso         : in std_logic;
    ds_cs           : out std_logic;
    -- Gamepad DualShock P2
    ds2_clk       : out std_logic;
    ds2_mosi      : out std_logic;
    ds2_miso      : in std_logic;
    ds2_cs        : out std_logic
    );
end;

architecture Behavioral_top of A2600_top_tm60k is

signal clk            : std_logic;
signal clk_cpu        : std_logic;
signal clk_14         : std_logic;
signal pll_locked     : std_logic;
signal clk_pixel_x5   : std_logic;
attribute syn_keep : integer;
attribute syn_keep of clk_cpu      : signal is 1;
attribute syn_keep of clk          : signal is 1;
attribute syn_keep of clk_14       : signal is 1;
attribute syn_keep of clk_pixel_x5 : signal is 1;
attribute syn_keep of m0s          : signal is 1;

  -- keyboard
signal keyboard_matrix_out : std_logic_vector(7 downto 0);
signal keyboard_matrix_in  : std_logic_vector(7 downto 0);
signal joyUsb1      : std_logic_vector(15 downto 0);
signal joyUsb2      : std_logic_vector(15 downto 0);
signal joyDigital   : std_logic_vector(15 downto 0);
signal joyNumpad    : std_logic_vector(15 downto 0);
signal joyMouse     : std_logic_vector(15 downto 0);
signal numpad       : std_logic_vector(7 downto 0);
signal joyDS2_p1    : std_logic_vector(15 downto 0);
signal joyDS2_p2    : std_logic_vector(15 downto 0);
-- joystick interface
signal joyA        : std_logic_vector(15 downto 0);
signal joyB        : std_logic_vector(15 downto 0);
signal joy_p1      : std_logic_vector(15 downto 0);
signal joy_p2      : std_logic_vector(15 downto 0);
signal port_1_sel  : std_logic_vector(3 downto 0);
signal port_2_sel  : std_logic_vector(3 downto 0);
-- mouse / paddle
signal pot1        : std_logic_vector(7 downto 0);
signal pot2        : std_logic_vector(7 downto 0);
signal pot3        : std_logic_vector(7 downto 0);
signal pot4        : std_logic_vector(7 downto 0);
signal pd1,pd2     : std_logic_vector(7 downto 0);
signal pd3,pd4     : std_logic_vector(7 downto 0);
signal p1,p2,p3,p4 : std_logic_vector(7 downto 0);
signal mouse_x_pos : signed(10 downto 0);
signal mouse_y_pos : signed(10 downto 0);
signal pal         : std_logic;
signal system_video_std : std_logic_vector(1 downto 0);
signal hsync       : std_logic;
signal vsync       : std_logic;
signal r           : unsigned(7 downto 0);
signal g           : unsigned(7 downto 0);
signal b           : unsigned(7 downto 0);

-- BL616 interfaces
signal mcu_start      : std_logic;
signal mcu_sys_strobe : std_logic;
signal mcu_hid_strobe : std_logic;
signal mcu_osd_strobe : std_logic;
signal mcu_sdc_strobe : std_logic;
signal data_in_start  : std_logic;
signal mcu_data_out   : std_logic_vector(7 downto 0);
signal hid_data_out   : std_logic_vector(7 downto 0);
signal osd_data_out   : std_logic_vector(7 downto 0) :=  X"55";
signal sys_data_out   : std_logic_vector(7 downto 0);
signal sdc_data_out   : std_logic_vector(7 downto 0);
signal hid_int        : std_logic;
signal system_scanlines : std_logic_vector(1 downto 0);
signal system_volume  : std_logic_vector(1 downto 0);
signal joystick1      : std_logic_vector(7 downto 0);
signal joystick2      : std_logic_vector(7 downto 0);
signal mouse_btns     : std_logic_vector(1 downto 0);
signal mouse_x        : signed(7 downto 0);
signal mouse_y        : signed(7 downto 0);
signal mouse_strobe   : std_logic;
signal osd_status     : std_logic;
signal ws2812_color   : std_logic_vector(23 downto 0);
signal system_reset   : std_logic_vector(1 downto 0);
signal sd_img_size    : std_logic_vector(31 downto 0);
signal sd_img_size_d  : std_logic_vector(31 downto 0);
signal sd_img_mounted : std_logic_vector(4 downto 0);
signal sd_rd          : std_logic_vector(4 downto 0);
signal sd_wr          : std_logic_vector(4 downto 0);
signal sd_lba         : std_logic_vector(31 downto 0);
signal sd_busy        : std_logic;
signal sd_done        : std_logic;
signal sd_rd_byte_strobe : std_logic;
signal sd_byte_index  : std_logic_vector(8 downto 0);
signal sd_rd_data     : std_logic_vector(7 downto 0);
signal sd_wr_data     : std_logic_vector(7 downto 0);
signal sd_change      : std_logic;
signal sdc_int        : std_logic;
signal sdc_iack       : std_logic;
signal int_ack        : std_logic_vector(7 downto 0);
signal spi_ext        : std_logic;
signal spi_io_din     : std_logic;
signal spi_io_ss      : std_logic;
signal spi_io_clk     : std_logic;
signal spi_io_dout    : std_logic;
signal system_wide_screen : std_logic;
signal leds           : std_logic_vector(5 downto 0);
signal system_leds    : std_logic_vector(1 downto 0);
signal db9_joy        : std_logic_vector(5 downto 0);
signal hblank          : std_logic;
signal vblank          : std_logic;
signal joystick_cs_i   : std_logic;
signal joystick_miso_i : std_logic;
signal paddle_1        : std_logic_vector(7 downto 0);
signal paddle_2        : std_logic_vector(7 downto 0);
signal paddle_3        : std_logic_vector(7 downto 0);
signal paddle_4        : std_logic_vector(7 downto 0);
signal key_r1          : std_logic;
signal key_r2          : std_logic;
signal key_l1          : std_logic;
signal key_l2          : std_logic;
signal key_triangle    : std_logic;
signal key_square      : std_logic;
signal key_circle      : std_logic;
signal key_cross       : std_logic;
signal key_up          : std_logic;
signal key_down        : std_logic;
signal key_left        : std_logic;
signal key_right       : std_logic;
signal key_start       : std_logic;
signal key_select      : std_logic;
signal key_lstick      : std_logic;
signal key_rstick      : std_logic;
signal key_r12         : std_logic;
signal key_r22         : std_logic;
signal key_l12         : std_logic;
signal key_l22         : std_logic;
signal key_triangle2   : std_logic;
signal key_square2     : std_logic;
signal key_circle2     : std_logic;
signal key_cross2      : std_logic;
signal key_up2         : std_logic;
signal key_down2       : std_logic;
signal key_left2       : std_logic;
signal key_right2      : std_logic;
signal key_start2      : std_logic;
signal key_select2     : std_logic;
signal key_lstick2      : std_logic;
signal key_rstick2      : std_logic;
---
signal video_r         : std_logic_vector(7 downto 0);
signal video_g         : std_logic_vector(7 downto 0);
signal video_b         : std_logic_vector(7 downto 0);
signal audio0          : std_logic_vector(3 downto 0);
signal audio1          : std_logic_vector(3 downto 0);

-- loader
signal load_crt        : std_logic := '0';
signal load_prg        : std_logic := '0';
signal load_rom        : std_logic := '0';
signal load_tap        : std_logic := '0';
signal loader_lba      : std_logic_vector(31 downto 0);
signal loader_busy     : std_logic;
signal img_select      : std_logic_vector(2 downto 0);
signal ioctl_download  : std_logic := '0';
signal ioctl_load_addr : std_logic_vector(22 downto 0);
signal ioctl_wr        : std_logic;
signal ioctl_data      : std_logic_vector(7 downto 0);
signal ioctl_addr      : std_logic_vector(22 downto 0);
signal ioctl_wait      : std_logic := '0';
signal dl_addr         : std_logic_vector(15 downto 0);
signal dl_data         : std_logic_vector(7 downto 0);
signal dl_wr           : std_logic;
signal ioctl_file_ext  : std_logic_vector(31 downto 0) := x"00000000";
signal rom_a           : std_logic_vector(15 downto 0);
signal rom_do          : std_logic_vector(7 downto 0);
signal reset2600       : std_logic;
signal system_sc       : std_logic_vector(1 downto 0);
signal sc              : std_logic;
signal scdetect        : std_logic;
signal decomb          : std_logic;
signal p_dif1          : std_logic;
signal p_dif2          : std_logic;
signal p_color         : std_logic;
signal paddle_1a       : std_logic_vector(7 downto 0);
signal paddle_2a       : std_logic_vector(7 downto 0);
signal p_start         : std_logic;
signal p_select        : std_logic;
signal vblank_regen    : std_logic;
signal force_bs        : std_logic_vector(4 downto 0);
signal joystick0ax     : signed(7 downto 0);
signal joystick0ay     : signed(7 downto 0);
signal joystick1ax     : signed(7 downto 0);
signal joystick1ay     : signed(7 downto 0);
signal joystick_strobe : std_logic;
signal joystick1_x_pos : std_logic_vector(7 downto 0);
signal joystick1_y_pos : std_logic_vector(7 downto 0);
signal joystick2_x_pos : std_logic_vector(7 downto 0);
signal joystick2_y_pos : std_logic_vector(7 downto 0);
signal extra_button0   : std_logic_vector(7 downto 0);
signal extra_button1   : std_logic_vector(7 downto 0);
signal img_size_crt    : std_logic_vector(31 downto 0);
signal paddle_inv      : std_logic;
signal joyswap         : std_logic;
signal paldetect       : std_logic;
signal reset_detect    : std_logic;
signal cart_download_d : std_logic;
signal cart_download   : std_logic;
signal bs_unsupported  : std_logic;

component CLKDIV
    generic (
        DIV_MODE : STRING := "2"
    );
    port (
        CLKOUT: out std_logic;
        HCLKIN: in std_logic;
        RESETN: in std_logic;
        CALIB: in std_logic
    );
end component;

begin

  hpd_en <= '1';
  O_sdram_cs_n <= '1';
  
-- ----------------- SPI input parser ----------------------
-- map output data onto both spi outputs
  spi_io_din  <= m0s(1);
  spi_io_ss   <= m0s(2);
  spi_io_clk  <= m0s(3);
  m0s(0)      <= spi_io_dout; -- M0 Dock

-- https://store.curiousinventor.com/guides/PS2/
-- https://hackaday.io/project/170365-blueretro/log/186471-playstation-playstation-2-spi-interface

gamepad_p1: entity work.dualshock2
    port map (
    clk           => clk,
    rst           => system_reset(0) and not pll_locked,
    vsync         => vsync,
    ds2_dat       => ds_miso,
    ds2_cmd       => ds_mosi,
    ds2_att       => ds_cs,
    ds2_clk       => ds_clk,
    ds2_ack       => '0',
    stick_lx      => paddle_1,
    stick_ly      => paddle_2,
    stick_rx      => open,
    stick_ry      => open,
    key_up        => key_up,
    key_down      => key_down,
    key_left      => key_left,
    key_right     => key_right,
    key_l1        => key_l1,
    key_l2        => key_l2,
    key_r1        => key_r1,
    key_r2        => key_r2,
    key_triangle  => key_triangle,
    key_square    => key_square,
    key_circle    => key_circle,
    key_cross     => key_cross,
    key_start     => key_start,
    key_select    => key_select,
    key_lstick    => key_lstick,
    key_rstick    => key_rstick,
    debug1        => open,
    debug2        => open
    );

gamepad_p2: entity work.dualshock2
    port map (
    clk           => clk,
    rst           => system_reset(0) and not pll_locked,
    vsync         => vsync,
    ds2_dat       => ds2_miso,
    ds2_cmd       => ds2_mosi,
    ds2_att       => ds2_cs,
    ds2_clk       => ds2_clk,
    ds2_ack       => '0',
    stick_lx      => paddle_3,
    stick_ly      => paddle_4,
    stick_rx      => open,
    stick_ry      => open,
    key_up        => key_up2,
    key_down      => key_down2,
    key_left      => key_left2,
    key_right     => key_right2,
    key_l1        => key_l12,
    key_l2        => key_l22,
    key_r1        => key_r12,
    key_r2        => key_r22,
    key_triangle  => key_triangle2,
    key_square    => key_square2,
    key_circle    => key_circle2,
    key_cross     => key_cross2,
    key_start     => key_start2,
    key_select    => key_select2,
    key_lstick    => open,
    key_rstick    => open,
    debug1        => open,
    debug2        => open
    );

led_ws2812: entity work.ws2812
  port map
  (
   clk    => clk,
   color  => ws2812_color,
   data   => ws2812
  );

sdc_iack <= int_ack(3);

sd_card_inst: entity work.sd_card
generic map (
    CLK_DIV  => 1
  )
    port map (
    rstn            => pll_locked, 
    clk             => clk,
  
    -- SD card signals
    sdclk           => sd_clk,
    sdcmd           => sd_cmd,
    sddat           => sd_dat,

    -- mcu interface
    data_strobe     => mcu_sdc_strobe,
    data_start      => mcu_start,
    data_in         => mcu_data_out,
    data_out        => sdc_data_out,

    -- interrupt to signal communication request
    irq             => sdc_int,
    iack            => sdc_iack,

    -- output file/image information. Image size is e.g. used by fdc to 
    -- translate between sector/track/side and lba sector
    image_size      => sd_img_size,           -- length of image file
    image_mounted   => sd_img_mounted,
    ioctl_file_ext  => ioctl_file_ext,

    -- user read sector command interface (sync with clk)
    rstart          => sd_rd,
    wstart          => sd_wr, 
    rsector         => loader_lba,
    rbusy           => sd_busy,
    rdone           => sd_done,           --  done from sd reader acknowledges/clears start

    -- sector data output interface (sync with clk)
    inbyte          => sd_wr_data,        -- sector data output interface (sync with clk)
    outen           => sd_rd_byte_strobe, -- when outen=1, a byte of sector content is read out from outbyte
    outaddr         => sd_byte_index,     -- outaddr from 0 to 511, because the sector size is 512
    outbyte         => sd_rd_data         -- a byte of sector content
);

video_inst: entity work.video 
port map(
      pll_lock     => pll_locked, 
      clk          => clk,
      clk_pixel_x5 => clk_pixel_x5,

      vb_in     => vblank,
      hb_in     => hblank,
      hs_in_n   => not hsync,
      vs_in_n   => not vsync,

      r_in      => video_r(7 downto 4),
      g_in      => video_g(7 downto 4),
      b_in      => video_b(7 downto 4),
      audio_l => signed("0" & audio0 & "0000000000"),
      audio_r => signed("0" & audio1 & "0000000000"),
      osd_status => osd_status,
      vblank_regenerate => vblank_regen,
      paldetect  => paldetect,
      mcu_start  => mcu_start,
      mcu_osd_strobe => mcu_osd_strobe,
      mcu_data  => mcu_data_out,

      -- values that can be configure by the user via osd
      system_wide_screen => system_wide_screen,
      system_scanlines => system_scanlines,
      system_volume => system_volume,

      tmds_clk_n => tmds_clk_n,
      tmds_clk_p => tmds_clk_p,
      tmds_d_n   => tmds_d_n,
      tmds_d_p   => tmds_d_p
      );

-- target
-- PAL  3.546894 Hz 28.375152 141.875760
-- NTSC 3.579545 Hz 28.636360 143.181800
mainclock: entity work.Gowin_PLL_ntsc_60k
    port map (
      reset   => '0',
      lock    => pll_locked,
      clkout0 => clk_pixel_x5,
      clkout1 => clk, -- 28Mhz (/5)
      clkin   => clk_50mhz
    );

div2_inst: CLKDIV
generic map(
  DIV_MODE => "2"
)
port map(
    CLKOUT => clk_14,
    HCLKIN => clk,
    RESETN => pll_locked,
    CALIB  => '0'
);

div3_inst: CLKDIV
generic map(
    DIV_MODE => "4"
)
port map(
    CLKOUT => clk_cpu,
    HCLKIN => clk_14,
    RESETN => pll_locked,
    CALIB  => '0'
);

leds_n(1 downto 0) <=  not leds(1 downto 0);
leds(1) <= '1' when force_bs > 14 else '0'; -- indicate unsupported mapper

-- 9 pin d-sub joystick pinout:
-- pin 1: up
-- pin 2: down
-- pin 3: left
-- pin 4: right
-- pin 6: fire
-- pin 9: fire 2nd button

-- Atari 2600, 6532 ports:
-- PA0: right joystick, up
-- PA1: right joystick, down
-- PA2: right joystick, left
-- PA3: right joystick, right
-- PA4: left joystick, up
-- PA5: left joystick, down
-- PA6: left joystick, left
-- PA7: left joystick, right
-- PB0: start
-- PB1: select
-- PB3: B/W, color
-- PB6: left difficulty
-- PB7: right difficulty

-- Atari 2600, TIA input:
-- I5: right joystick, fire
-- I6: left joystick, fire

-- pinout docking station joystick 1/2:
-- bit 0: up
-- bit 1: down
-- bit 2: left
-- bit 3: right
-- bit 4: fire
-- bit 5: 2nd fire (required for paddle emulation)

-- BTN_RIGHT       0
-- BTN_LEFT        1
-- BTN_DOWN        2
-- BTN_UP          3
-- BTN_A           4
-- BTN_B           5
-- BTN_X           6
-- BTN_Y           7
-- BTN_SL          8
-- BTN_SR          9
-- BTN_SELECT     10
-- BTN_START      11
joyDS2_p1  <= key_rstick & key_lstick & key_r2 & key_l2 & key_start & key_select & key_r1 & key_l1 &
              key_square & key_triangle & key_cross & key_circle & key_up & key_down & key_left & key_right;
joyDS2_p2  <= key_rstick2 & key_lstick2 & key_r22 & key_l22 & key_start2 & key_select2 & key_r12 & key_l12 &
              key_square2 & key_triangle2 & key_cross2 & key_circle2 & key_up2 & key_down2 & key_left2 & key_right2;
joyDigital <= not(x"FF" & "111" & io(0) & io(2) & io(1) & io(4) & io(3));
joyUsb1    <= extra_button0 & joystick1(7 downto 4) & joystick1(3) & joystick1(2) & joystick1(1) & joystick1(0);
joyUsb2    <= extra_button1 & joystick2(7 downto 4) & joystick2(3) & joystick2(2) & joystick2(1) & joystick2(0);
joyNumpad  <= x"00" & "000" & numpad(4) & numpad(3) & numpad(2) & numpad(1) & numpad(0);
joyMouse   <= x"0000";

-- send external DB9 joystick port to µC
db9_joy <= not ('0' & io(0) & io(2) & io(1) & io(4) & io(3));

process(clk)
begin
	if rising_edge(clk) then
    case port_1_sel is
      when "0000"  => joyA <= joyDigital;
      when "0001"  => joyA <= joyUsb1;
      when "0010"  => joyA <= joyUsb2;
      when "0011"  => joyA <= joyNumpad;
      when "0100"  => joyA <= joyDS2_p1;
      when "0101"  => joyA <= joyMouse;
      when "0110"  => joyA <= (others => '0');
      when "1010"  => joyA <= joyDS2_p2;
      when others  => joyA <= (others => '0');
    end case;
  end if;
end process;

process(clk)
begin
	if rising_edge(clk) then
    case port_2_sel is
      when "0000"  => joyB <= joyDigital;
      when "0001"  => joyB <= joyUsb1;
      when "0010"  => joyB <= joyUsb2;
      when "0011"  => joyB <= joyNumpad;
      when "0100"  => joyB <= joyDS2_p1;
      when "0101"  => joyB <= joyMouse;
      when "0110"  => joyB <= (others => '0');
      when "1010"  => joyB <= joyDS2_p2;
      when others  => joyB <= (others => '0');
      end case;
  end if;
end process;

-- paddle pins
pd1 <= not paddle_1 when port_1_sel = "0100" else
        joystick1_x_pos(7 downto 0) when port_1_sel = "0001" else
        x"ff";
pd2 <= not paddle_2 when port_1_sel = "0100" else
        joystick1_y_pos(7 downto 0) when port_1_sel = "0001" else
        x"ff";
pd3 <= not paddle_3 when port_2_sel = "0100" else
        joystick2_x_pos(7 downto 0) when port_2_sel = "0010" else
        x"ff";
pd4 <= not paddle_4 when port_2_sel = "0100" else
        joystick2_y_pos(7 downto 0) when port_2_sel = "0010" else
        x"ff";

process(clk, system_reset(0))
 variable mov_x: signed(6 downto 0);
 variable mov_y: signed(6 downto 0);
 begin
  if system_reset(0) = '1' then
    joystick1_x_pos <= x"ff";
    joystick1_y_pos <= x"ff";
    joystick2_x_pos <= x"ff";
    joystick2_y_pos <= x"ff";
    elsif rising_edge(clk) then
      if joystick_strobe = '1' then
        joystick1_x_pos <= std_logic_vector(joystick0ax(7 downto 0));
        joystick1_y_pos <= std_logic_vector(joystick0ay(7 downto 0));
        joystick2_x_pos <= std_logic_vector(joystick1ax(7 downto 0));
        joystick2_y_pos <= std_logic_vector(joystick1ay(7 downto 0));
      end if;
    end if;
end process;

mcu_spi_inst: entity work.mcu_spi 
port map (
  clk            => clk,
  reset          => not pll_locked,
  -- SPI interface to BL616 MCU
  spi_io_ss      => spi_io_ss,      -- SPI CSn
  spi_io_clk     => spi_io_clk,     -- SPI SCLK
  spi_io_din     => spi_io_din,     -- SPI MOSI
  spi_io_dout    => spi_io_dout,    -- SPI MISO
  -- byte interface to the various core components
  mcu_sys_strobe => mcu_sys_strobe, -- byte strobe for system control target
  mcu_hid_strobe => mcu_hid_strobe, -- byte strobe for HID target  
  mcu_osd_strobe => mcu_osd_strobe, -- byte strobe for OSD target
  mcu_sdc_strobe => mcu_sdc_strobe, -- byte strobe for SD card target
  mcu_start      => mcu_start,
  mcu_sys_din    => sys_data_out,
  mcu_hid_din    => hid_data_out,
  mcu_osd_din    => osd_data_out,
  mcu_sdc_din    => sdc_data_out,
  mcu_dout       => mcu_data_out
);

-- decode SPI/MCU data received for human input devices (HID) 
hid_inst: entity work.hid
 port map 
 (
  clk             => clk,
  reset           => not pll_locked,
  -- interface to receive user data from MCU (mouse, kbd, ...)
  data_in_strobe  => mcu_hid_strobe,
  data_in_start   => mcu_start,
  data_in         => mcu_data_out,
  data_out        => hid_data_out,

  -- input local db9 port events to be sent to MCU
  db9_port        => db9_joy,
  irq             => hid_int,
  iack            => int_ack(1),
  -- output HID data received from USB
  joystick0       => joystick1,
  joystick1       => joystick2,
  numpad          => numpad,
  keyboard_matrix_out => keyboard_matrix_out,
  keyboard_matrix_in  => keyboard_matrix_in,
  key_restore     => open,
  tape_play       => open,
  mod_key         => open,
  mouse_btns      => mouse_btns,
  mouse_x         => mouse_x,
  mouse_y         => mouse_y,
  mouse_strobe    => mouse_strobe,
  joystick0ax     => joystick0ax,
  joystick0ay     => joystick0ay,
  joystick1ax     => joystick1ax,
  joystick1ay     => joystick1ay,
  joystick_strobe => joystick_strobe,
  extra_button0   => extra_button0,
  extra_button1   => extra_button1
 );

module_inst: entity work.sysctrl 
 port map 
 (
  clk                 => clk,
  reset               => not pll_locked,
--
  data_in_strobe      => mcu_sys_strobe,
  data_in_start       => mcu_start,
  data_in             => mcu_data_out,
  data_out            => sys_data_out,

  -- values that can be configured by the user
  system_reset        => system_reset,
  system_scanlines    => system_scanlines,
  system_volume       => system_volume,
  system_wide_screen  => system_wide_screen,
  system_port_1       => port_1_sel,
  system_port_2       => port_2_sel,
  system_paddle       => paddle_inv,
  system_diff_p1      => p_dif1,
  system_diff_p2      => p_dif2,
  system_decomb       => decomb,
  system_vblank       => vblank_regen,
  system_vm           => p_color,
  system_sc           => system_sc,
  system_video_std    => system_video_std,
  system_joyswap      => joyswap,

  int_out_n           => m0s(4),
  int_in              => unsigned'("0000" & sdc_int & '0' & hid_int & '0'),
  int_ack             => int_ack,

  buttons             => unsigned'(not reset & not user), -- S0 and S1 button
  leds                => system_leds, -- two leds can be controlled from the MCU
  color               => ws2812_color -- a 24bit color to e.g. be used to drive the ws2812
);

sd_rd(4) <= '0';
sd_wr(4 downto 0) <= "00000";

  crt_inst : entity work.loader_sd_card
  port map (
    clk               => clk,
    system_reset      => system_reset,
  
    sd_lba            => loader_lba,
    sd_rd             => sd_rd(3 downto 0),
    sd_wr             => open,
    sd_busy           => sd_busy,
    sd_done           => sd_done,
  
    sd_byte_index     => sd_byte_index,
    sd_rd_data        => sd_rd_data,
    sd_rd_byte_strobe => sd_rd_byte_strobe,
  
    sd_img_mounted    => sd_img_mounted,
    loader_busy       => loader_busy,
    load_crt          => load_crt,
    sd_img_size       => sd_img_size,
    leds(0)           => leds(0),
    img_select        => img_select,
    img_size_crt      => img_size_crt,
    
    ioctl_download    => ioctl_download,
    ioctl_addr        => ioctl_addr,
    ioctl_data        => ioctl_data,
    ioctl_wr          => ioctl_wr,
    ioctl_wait        => ioctl_wait
  );

reset2600 <= system_reset(0) or not pll_locked or cart_download;

-- swap joysticks and paddle
joy_p1 <= joyB when joyswap = '1' else joyA;
joy_p2 <= joyA when joyswap = '1' else joyB;
pot1 <= (not pd3(7) & pd3(6 downto 0)) when joyswap = '1' else (not pd1(7) & pd1(6 downto 0));
pot2 <= (not pd4(7) & pd4(6 downto 0)) when joyswap = '1' else (not pd2(7) & pd2(6 downto 0));
pot3 <= (not pd1(7) & pd1(6 downto 0)) when joyswap = '1' else (not pd3(7) & pd3(6 downto 0));
pot4 <= (not pd2(7) & pd2(6 downto 0)) when joyswap = '1' else (not pd4(7) & pd4(6 downto 0));

-- invert paddle
p1 <= not pot1 when paddle_inv = '1' else pot1;
p2 <= not pot2 when paddle_inv = '1' else pot2;
p3 <= not pot3 when paddle_inv = '1' else pot3;
p4 <= not pot4 when paddle_inv = '1' else pot4;

a2601_inst: entity work.A2601top
   port map(
		reset     => reset2600,
		clk       => clk_cpu,  -- 3.5Mhz
		vid_clk   => clk,      -- 28Mhz

		aud0      => audio0,
		aud1      => audio1,

		O_VSYNC   => vsync, 
		O_HSYNC   => hsync, 
		O_HBLANK  => hblank, 
		O_VBLANK  => vblank, 
		O_VIDEO_R => video_r,
		O_VIDEO_G => video_g,
		O_VIDEO_B => video_b,
		p1_l      => not joy_p1(1), 
		p1_r      => not joy_p1(0), 
		p1_u      => not joy_p1(3), 
		p1_d      => not joy_p1(2), 
		p1_f      => not joy_p1(4),  -- BTN_A
		p1_f2     => not joy_p1(7),  -- BTN_Y

		p2_l      => not joy_p2(1),
		p2_r      => not joy_p2(0),
		p2_u      => not joy_p2(3),
		p2_d      => not joy_p2(2), 
		p2_f      => not joy_p2(4),  -- BTN_A
		p2_f2     => not joy_p2(7),  -- BTN_Y

		p_1       => not joy_p1(5), -- BTN_B
		paddle_1  => p1,

		p_2       => not joy_p2(5), -- BTN_B
		paddle_2  => p2,

		p_3       => not joy_p1(6), -- BTN_X
		paddle_3  => p3,

		p_4       => not joy_p2(6), -- BTN_X
		paddle_4  => p4,

		p_type    => "00",

		p_start   => p_start,
		p_select  => p_select,
		p_color   => p_color,

		sc        => sc, -- SuperChip enable
		force_bs  => force_bs, -- forced bank switch type
		rom_a     => rom_a, 
		rom_do    => rom_do, 
		rom_size  => img_size_crt(16 downto 0),

		pause     => '0',

		pal       => pal,
		p_dif     => not (p_dif2 & p_dif1),  -- 0 = B, 1 = A
		decomb    => decomb
	);

p_start  <= '0' when (joyA(11) = '1' or joyB(11) = '1' or numpad(6) = '1') else '1';-- BTN_SELECT / F11
p_select <= '0' when (joyA(10) = '1' or joyB(10) = '1' or numpad(7) = '1') else '1';-- BTN_START  / PAGE UP

cart_download <= ioctl_download and load_crt;
process(clk)
begin
  if rising_edge(clk) then
      reset_detect <= '0';
      cart_download_d <= cart_download;
      if (not cart_download_d and cart_download) then
        reset_detect <= '1';
      end if;
  end if;
end process;

detect_inst: entity work.detect2600
port map(
  clk       => clk,
  reset     => reset_detect or system_reset(0),
  addr      => dl_addr(15 downto 0),
  enable    => ioctl_wr and cart_download,
  cart_size => img_size_crt,
  data      => dl_data,
  force_bs  => force_bs,
  sc        => scdetect
);

pal <= '1' when system_video_std(1 downto 0) = 2 else 
       '0' when system_video_std(1 downto 0) = 1 else 
       paldetect;
sc  <= '1' when system_sc(1 downto 0) = 2 else 
       '0' when system_sc(1 downto 0) = 1 else 
       scdetect;

process(clk)
begin
  if rising_edge(clk) then
    dl_wr <= '0';
    if cart_download then
      if ioctl_wr = '1' then
          dl_addr <= ioctl_addr(15 downto 0);
          dl_data <= ioctl_data;
          dl_wr <= '1';
      end if;
    end if;
   end if;
end process;

ram_inst: entity work.Gowin_SDPB
  port map (
      dout   => rom_do,
      adb    => rom_a,
      ceb    => '1',
      clkb   => clk_cpu,
      oce    => '1',
      reset  => '0',

      clka   => clk,
      cea    => dl_wr,
      ada    => dl_addr,
      din    => dl_data
  );

end Behavioral_top;
