object FormMain: TFormMain
  Left = 199
  Top = 140
  ActiveControl = ButtonOK
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'InModem Version 0.1.0'
  ClientHeight = 121
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 102
    Width = 352
    Height = 19
    Panels = <
      item
        Text = 'AirPort modem: Disconnected'
        Width = 150
      end
      item
        Text = 'Speed:'
        Width = 100
      end
      item
        Text = 'Time:'
        Width = 100
      end>
    SimplePanel = False
  end
  object ButtonApply: TButton
    Left = 272
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Apply'
    Enabled = False
    TabOrder = 1
    OnClick = ButtonApplyClick
  end
  object GroupBoxConf: TGroupBox
    Left = 8
    Top = 8
    Width = 337
    Height = 57
    Caption = 'Configuration'
    TabOrder = 2
    object LabelAddress: TLabel
      Left = 8
      Top = 24
      Width = 75
      Height = 13
      Caption = 'AirPort Address:'
      Layout = tlCenter
    end
    object EditAddress: TEdit
      Left = 96
      Top = 24
      Width = 233
      Height = 21
      TabOrder = 0
      Text = '10.0.1.1'
      OnChange = EditAddressChange
    end
  end
  object ButtonCancel: TButton
    Left = 192
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = ButtonCancelClick
  end
  object ButtonOK: TButton
    Left = 112
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = ButtonOKClick
  end
  object TrayIcon: TTrayIcon
    Active = True
    Animate = False
    ShowDesigning = False
    Icon.Data = {
      0000010001001010000001002000680400001600000028000000100000002000
      0000010020000000000000000000130B0000130B000000000000000000000000
      0000000000004A4A4A234A4A4A944A4A4ACF4A4A4AF24A4A4AF54A4A4AF54A4A
      4AF84A4A4AF54A4A4AF54A4A4AD94A4A4A9C4A4A4A2E00000000000000004A4A
      4A284A4A4AC94B4B4BFF616161FF848484FFB7B7B7FFBEBEBEFFBEBEBEFFC8C8
      C8FFBEBEBEFFB1B1C2FF5555BBFF505083FF4C4C4CFF4A4A4AD44A4A4A524A4A
      4AD4767676FFEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF9999FFFF0000FFFF0000FFFF7777FFFFF7F7F7FF888888FF4A4A4AFF4C4C
      4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF0000
      00FFDDDDFFFF000000FF0000FFFF2222FFFFFFFFFFFFFFFFFFFF585858FF4A4A
      4AF8C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFF0000
      00FFFFFFFFFF000000FF6666FFFFAAAAFFFFFFFFFFFFEEEEEEFF4B4B4BFF4A4A
      4AAA505050FFE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FF5B5B5BFF4A4A4AC90000
      00004A4A4AC44F4F4FFFC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7FF525252FF4A4A4ACC000000000000
      0000000000004A4A4AA74A4A4AFF696969FFD7D7D7FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE2E2E2FF4343A9FF1919C3FF0303F6FA00000000000000000000
      000000000000000000004A4A4A064A4A4AB84A4A4AFB575757FF7B7B7BFF8484
      84FF5C5C5CFF4A4A4AFF1414CDEA0000FFFF0000FFFF0000FF55000000000000
      000000000000000000000000000000000000000000004A4A4A774A4A4AC44A4A
      4ACF4A4A4A884A4A4A120000FF660000FFFF0000FFFF0000FF88000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF220000FFFF0000FFFF0000FFDD000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFCC0000FFFF0000FFFF0000FF220000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF880000FFFF0000FFFF0000FF770000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF440000FFFF0000FFFF0000FFAA0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FFEE0000FFFF0000FFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF990000FF990000FF66E007
      0000800100000000000000000000000000000000000080010000C0030000F003
      0000FE310000FFF10000FFF10000FFF10000FFF80000FFF80000FFF90000}
    OnDblClick = TrayIconDblClick
    PopupMenu = PopupMenu
    Left = 8
    Top = 72
  end
  object UdpClient: TIdUDPClient
    OnStatus = UdpClientStatus
    Active = True
    BroadcastEnabled = True
    Port = 0
    ReceiveTimeout = 5
    Left = 16
    Top = 72
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 24
    Top = 72
    object MenuStatus: TMenuItem
      Caption = 'AirPort modem: Not connected'
      Enabled = False
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuConnect: TMenuItem
      Caption = 'Connect'
      OnClick = MenuConnectClick
    end
    object MenuDisconnect: TMenuItem
      Caption = 'Disconnect'
      OnClick = MenuDisconnectClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MenuProperties: TMenuItem
      Caption = 'Properties'
      Default = True
      OnClick = MenuPropertiesClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MenuAbout: TMenuItem
      Caption = 'About'
      OnClick = MenuAboutClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object MenuExit: TMenuItem
      Caption = 'Exit'
      OnClick = MenuExitClick
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 32
    Top = 72
  end
  object ImageListIcons: TImageList
    Left = 40
    Top = 72
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009595
      95006C6C6C005353530051515100515151004E4E4E0051515100515151006464
      6400909090000000000000000000000000000000000000000000000000009595
      95006C6C6C005353530051515100515151004E4E4E0051515100515151006464
      6400909090000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000707070004B4B4B006161
      610084848400B7B7B700BEBEBE00BEBEBE00C8C8C800BEBEBE00BEBEBE008E8E
      8E00646464004C4C4C00686868000000000000000000707070004B4B4B006161
      610084848400B7B7B700BEBEBE00BEBEBE00C8C8C800BEBEBE00B1B1C2005555
      BB00505083004C4C4C0068686800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006868680076767600EEEEEE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700888888004A4A4A006868680076767600EEEEEE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009999FF000000FF000000
      FF007777FF00F7F7F700888888004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004C4C4C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00585858004C4C4C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000DDDDFF00000000000000
      FF002222FF00FFFFFF00FFFFFF00585858000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004E4E4E00C8C8C800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00EEEEEE004B4B4B004E4E4E00C8C8C800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00000000006666
      FF00AAAAFF00FFFFFF00EEEEEE004B4B4B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008686860050505000E6E6E600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F3F3005B5B5B00707070008686860050505000E6E6E600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F3F3005B5B5B00707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000737373004F4F4F00C5C5
      C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D7D7D700525252006E6E6E000000000000000000737373004F4F4F00C5C5
      C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D7D7D700525252006E6E6E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000888888004A4A
      4A0069696900D7D7D700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2E2E2007070
      70004B4B4B007C7C7C0000000000000000000000000000000000888888004A4A
      4A0069696900D7D7D700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2E2E2004343
      A9001919C3000707F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007C7C7C004C4C4C00575757007B7B7B00848484005C5C5C004A4A4A007676
      7600000000000000000000000000000000000000000000000000000000000000
      00007C7C7C004C4C4C00575757007B7B7B00848484005C5C5C004A4A4A002727
      D1000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000737373006C6C6C009E9E9E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000737373006C6C6C009E9E9E00000000000000
      00000000FF000000FF007777FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF002222FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003333FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007777FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF0000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF005555FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001111FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006666FF006666FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009595
      95006C6C6C005353530051515100515151004E4E4E0051515100515151006464
      6400909090000000000000000000000000000000000000000000000000009595
      95006C6C6C005353530051515100515151004E4E4E0051515100515151006464
      6400909090000000000000000000000000000000000000000000000000009595
      95006C6C6C005353530051515100515151004E4E4E0051515100515151006464
      6400909090000000000000000000000000000000000000000000000000009595
      95006C6C6C005353530051515100515151004E4E4E0051515100515151006464
      64009090900000000000000000000000000000000000707070004B4B4B006161
      610084848400B7B7B700BEBEBE00BEBEBE00C8C8C800BEBEBE00BEBEBE008E8E
      8E00646464004C4C4C00686868000000000000000000707070004B4B4B006161
      610084848400B7B7B700BEBEBE00BEBEBE00C8C8C800BEBEBE00BEBEBE008E8E
      8E00646464004C4C4C00686868000000000000000000707070004B4B4B006161
      610084848400B7B7B700BEBEBE00BEBEBE00C8C8C800BEBEBE00BEBEBE008E8E
      8E00646464004C4C4C00686868000000000000000000707070004B4B4B006161
      610084848400B7B7B700BEBEBE00BEBEBE00C8C8C800BEBEBE00BEBEBE008E8E
      8E00646464004C4C4C0068686800000000006868680076767600EEEEEE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700888888004A4A4A006868680076767600EEEEEE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700888888004A4A4A006868680076767600EEEEEE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700888888004A4A4A006868680076767600EEEEEE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700888888004A4A4A004C4C4C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00585858004C4C4C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00585858004C4C4C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00585858004C4C4C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00585858004E4E4E00C8C8C800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00EEEEEE004B4B4B004E4E4E00C8C8C800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00EEEEEE004B4B4B004E4E4E00C8C8C800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00EEEEEE004B4B4B004E4E4E00C8C8C800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00EEEEEE004B4B4B008686860050505000E6E6E600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F3F3005B5B5B00707070008686860050505000E6E6E600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F3F3005B5B5B00707070008686860050505000E6E6E600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F3F3005B5B5B00707070008686860050505000E6E6E600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F3F3005B5B5B007070700000000000737373004F4F4F00C5C5
      C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D7D7D700525252006E6E6E000000000000000000737373004F4F4F00C5C5
      C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D7D7D700525252006E6E6E000000000000000000737373004F4F4F00C5C5
      C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D7D7D700525252006E6E6E000000000000000000737373004F4F4F00C5C5
      C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D7D7D700525252006E6E6E00000000000000000000000000888888004A4A
      4A0069696900D7D7D700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2E2E2007070
      70004B4B4B007C7C7C0000000000000000000000000000000000888888004A4A
      4A0069696900D7D7D700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2E2E2007070
      70004B4B4B007C7C7C0000000000000000000000000000000000888888004A4A
      4A0069696900D7D7D700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2E2E2007070
      70004B4B4B007C7C7C0000000000000000000000000000000000888888004A4A
      4A0069696900D7D7D700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2E2E2007070
      70004B4B4B007C7C7C0000000000000000000000000000000000000000000000
      00007C7C7C004C4C4C00575757007B7B7B00848484005C5C5C004A4A4A007676
      7600000000000000000000000000000000000000000000000000000000000000
      00007C7C7C004C4C4C00575757007B7B7B00848484005C5C5C004A4A4A007676
      7600000000000000000000000000000000000000000000000000000000000000
      00007C7C7C004C4C4C00575757007B7B7B00848484005C5C5C004A4A4A007676
      7600000000000000000000000000000000000000000000000000000000000000
      00007C7C7C004C4C4C00575757007B7B7B00848484005C5C5C004A4A4A007676
      7600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000737373006C6C6C009E9E9E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000737373006C6C6C009E9E9E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000737373006C6C6C009E9E9E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000737373006C6C6C009E9E9E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000BAFF0000000000000000000000000000000000000000000000000000BA
      FF00000000000000000000000000000000000000000000000000000000000000
      000000BAFF0000000000000000000000000000000000000000000000000000BA
      FF00000000000000000000000000000000000000000000000000000000000000
      000000BAFF0000000000000000000000000000000000000000000000000000BA
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FF060000000000000000000000000000000000000000000000000000FF
      0600000000000000000000000000000000000000000000000000000000000000
      00000000000000BAFF0000BAFF0000BAFF0000BAFF0000BAFF0000BAFF000000
      0000000000000000000000000000000000000000000000BAFF00000000000000
      00000000000000BAFF0000BAFF0000BAFF0000BAFF0000BAFF0000BAFF000000
      0000000000000000000000BAFF00000000000000000000BAFF00000000000000
      00000000000000BAFF0000BAFF0000BAFF0000BAFF0000BAFF0000BAFF000000
      0000000000000000000000BAFF00000000000000000000FF0600000000000000
      00000000000000FF060000FF060000FF060000FF060000FF060000FF06000000
      0000000000000000000000FF0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000BAFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000BAFF000000000000000000000000000000000000BAFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000BAFF000000000000000000000000000000000000FF06000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF060000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000BA
      FF0000BAFF0000BAFF0000BAFF0000BAFF0000BAFF0000BAFF0000BAFF0000BA
      FF0000BAFF0000000000000000000000000000BAFF00000000000000000000BA
      FF0000BAFF0000BAFF0000BAFF0000BAFF0000BAFF0000BAFF0000BAFF0000BA
      FF0000BAFF00000000000000000000BAFF0000FF0600000000000000000000FF
      060000FF060000FF060000FF060000FF060000FF060000FF060000FF060000FF
      060000FF0600000000000000000000FF06000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000BAFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000BAFF0000FF060000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF06000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000BAFF0000BAFF0000BA
      FF0000BAFF0000BAFF0000BAFF0000BAFF0000BAFF0000BAFF0000BAFF0000BA
      FF0000BAFF0000BAFF0000BAFF00000000000000000000FF060000FF060000FF
      060000FF060000FF060000FF060000FF060000FF060000FF060000FF060000FF
      060000FF060000FF060000FF060000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000E007E007000000008001800100000000
      0000000000000000000000000000000000000000000000000000000000000000
      8001800100000000C003C00300000000F00FF00300000000FE3FFE3100000000
      F7EFFFF100000000B81DFFF100000000DFFBFFF1000000006006FFF800000000
      7FFEFFF8000000008001FFF900000000E007E007E007E0078001800180018001
      0000000000000000000000000000000000000000000000000000000000000000
      8001800180018001C003C003C003C003F00FF00FF00FF00FFE3FFE3FFE3FFE3F
      F7EFF7EFF7EFF7EFF81FB81DB81DB81DFFFFDFFBDFFBDFFBFFFFE00760066006
      FFFFFFFF7FFE7FFEFFFFFFFF8001800100000000000000000000000000000000
      000000000000}
  end
end
