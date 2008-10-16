{
    InModem -- Utility to control the Apple AirPort Base Station modem
    Copyright (C) 2003-2004  Jason Barrie Morley
    inertia@in7.co.uk  http://www.in7.co.uk

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TrayIcon, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  Menus, ComCtrls, ExtCtrls, ImgList, registry;

type
  TFormMain = class(TForm)
    TrayIcon: TTrayIcon;
    UdpClient: TIdUDPClient;
    PopupMenu: TPopupMenu;
    MenuConnect: TMenuItem;
    MenuDisconnect: TMenuItem;
    N1: TMenuItem;
    MenuExit: TMenuItem;
    N2: TMenuItem;
    MenuStatus: TMenuItem;
    N3: TMenuItem;
    MenuProperties: TMenuItem;
    StatusBar: TStatusBar;
    ButtonApply: TButton;
    GroupBoxConf: TGroupBox;
    Timer1: TTimer;
    EditAddress: TEdit;
    LabelAddress: TLabel;
    ButtonCancel: TButton;
    ButtonOK: TButton;
    ImageListIcons: TImageList;
    N4: TMenuItem;
    MenuAbout: TMenuItem;
    procedure MenuExitClick(Sender: TObject);
    procedure MenuConnectClick(Sender: TObject);
    procedure MenuDisconnectClick(Sender: TObject);
    procedure MenuPropertiesClick(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditAddressChange(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure UdpClientStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure MenuAboutClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
  private
    { Private declarations }
    function GetInteger( Bytes: array of byte ): integer; overload;
    function GetInteger( Bytes: array of byte; intStart: integer; intLength: integer ): integer; overload;
    procedure SaveSettings();
    procedure LoadSettings();
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

  stringAirPortAddress: string;
  intCurrentIcon: integer;

  stringModemStatus: string;
  boolConnect, boolDisconnect: boolean;

implementation

uses Unit2;

{$R *.DFM}

// Function to convert byte arrays to integers.
function TFormMain.GetInteger( Bytes: array of byte ): integer;
begin
    Result := GetInteger( Bytes, 0, Length( Bytes ) );
end;

// Function to convert byte arrays to integers.
function TFormMain.GetInteger( Bytes: array of byte; intStart: integer; intLength: integer ): integer;
var
    intAbsolute, intReturn, i: integer;
begin

    intReturn := 0;

    for i := intStart to ( intStart + intLength - 1 ) do
    begin
        intAbsolute := Bytes[ i ];
        if ( intAbsolute < 0 ) then intAbsolute := intAbsolute + 256;
        intReturn := ( intReturn * 256 ) + intAbsolute;
    end;

    Result := intReturn;

end;

procedure TFormMain.MenuExitClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TFormMain.MenuConnectClick(Sender: TObject);
var
    arrayPacket: array[0..115] of byte;    
begin

    try

        // Set the connection.
        UdpClient.Host := stringAirPortAddress;
        UdpClient.Port := 192;

        // Status packet.
        arrayPacket[0] := $08;
        arrayPacket[1] := $01;
        arrayPacket[2] := $03;
        arrayPacket[3] := $10;

        // Connect Packet
        arrayPacket[0] := $07;

        // Send the packet.
        UdpClient.SendBuffer( arrayPacket, 116 );

    except

        MessageDlg( 'Network failure', mtError, [mbOk], 0);

    end;

end;

procedure TFormMain.MenuDisconnectClick(Sender: TObject);
var
    arrayPacket: array[0..115] of byte;    
begin

    try

        // Set the connection.
        UdpClient.Host := stringAirPortAddress;
        UdpClient.Port := 192;

        // Status packet.
        arrayPacket[0] := $08;
        arrayPacket[1] := $01;
        arrayPacket[2] := $03;
        arrayPacket[3] := $10;

        // Connect Packet
        arrayPacket[0] := $06;

        // Send the packet.
        UdpClient.SendBuffer( arrayPacket, 116 );

    except

        MessageDlg( 'Network failure', mtError, [mbOk], 0);

    end;

end;

procedure TFormMain.MenuPropertiesClick(Sender: TObject);
begin
    FormMain.Visible := true;
end;

procedure TFormMain.TrayIconDblClick(Sender: TObject);
begin
    FormMain.Visible := true;
end;

procedure TFormMain.Timer1Timer(Sender: TObject);
var
    arrayPacket: array[0..115] of byte;
    arrayReceive: array[0..127] of byte;
    arrayTemp, arrayType: array[0..1] of byte;
    i, intLength, intTag: integer;
    intTime, intHours, intMinutes, intSeconds: integer;
    stringTime, stringHours, stringMinutes, stringSeconds: string;
    intConnected: integer;
    intSpeed: integer;
begin

    try

        // Set the connection.
        UdpClient.Host := stringAirPortAddress;
        UdpClient.Port := 192;

        // Status packet.
        arrayPacket[0] := $08;
        arrayPacket[1] := $01;
        arrayPacket[2] := $03;
        arrayPacket[3] := $10;

        // Send the packet.
        UdpClient.SendBuffer( arrayPacket, 116 );

        // Wait for the response.
        UdpClient.ReceiveBuffer( arrayReceive, 128 );

        // Analyse the response.
        arrayType[0] := arrayReceive[0];
        arrayType[1] := arrayReceive[1];

        i := 2;

        while ( i < 128 ) do
        begin

            // Read the length.
            arrayTemp[0] := arrayReceive[i];
            arrayTemp[1] := arrayReceive[i+1];
            intLength := GetInteger( arrayTemp );

            // Read the tag.
            arrayTemp[0] := arrayReceive[i+2];
            arrayTemp[1] := arrayReceive[i+3];
            intTag := GetInteger( arrayTemp );

            // Process the current information.
            if ( intTag = $0311 ) then
            begin
                intConnected := GetInteger( arrayReceive, i+4, intLength-2 );
            end;

            if ( intTag = $0315 ) then
            begin
                intSpeed := GetInteger( arrayReceive, i+4, intLength-2 );
            end;

            if ( intTag = $0316 ) then
            begin
                // Get the value.
                intTime := GetInteger( arrayReceive, i+4, intLength-2 );

                // Decode the time.
                intHours := intTime div 3600;
                intMinutes := ( intTime div 60 ) mod 60;
                intSeconds := intTime mod 60;

                // Zero extend the strings.
                stringHours := IntToStr( intHours );
                stringMinutes := IntToStr( intMinutes );
                stringSeconds := IntToStr( intSeconds );

                if ( Length( stringHours ) = 1 ) then stringHours := '0' + stringHours;
                if ( Length( stringMinutes ) = 1 ) then stringMinutes := '0' + stringMinutes;
                if ( Length( stringSeconds ) = 1 ) then stringSeconds := '0' + stringSeconds;

                // Concatonate the time.
                stringTime := stringHours + ':' + stringMinutes + ':' + stringSeconds;
            end;

            if ( intTag = $0319 ) then
            begin

            end;

            // Increment i.
            i := i + 2 + intLength;

        end;

        // Display the data.

        if ( intConnected = 0 ) then
        // AirPort is unavailable. i.e. Modem is not available?
        begin
            TrayIcon.ToolTip := 'Modem unavailable';

            stringModemStatus := 'Unavailable';
            boolDisconnect := false;
            boolConnect := false;

            StatusBar.Panels[0].Text := 'AirPort modem: ' + stringModemStatus;
            StatusBar.Panels[1].Text := 'Speed:';
            StatusBar.Panels[2].Text := 'Time:';

            ImageListIcons.GetIcon( 5, TrayIcon.Icon );
        end
        else if ( intConnected = 1 ) then
        // Modem available but disconnected.
        begin
            TrayIcon.ToolTip := 'Not connected';

            stringModemStatus := 'Not connected';
            boolDisconnect := false;
            boolConnect := true;

            StatusBar.Panels[0].Text := 'AirPort modem: ' + stringModemStatus;
            StatusBar.Panels[1].Text := 'Speed:';
            StatusBar.Panels[2].Text := 'Time:';

            ImageListIcons.GetIcon( 4, TrayIcon.Icon );
        end
        else if ( intConnected = 2 ) then
        // Dialing
        begin
            TrayIcon.ToolTip := 'Modem dialing';

            stringModemStatus := 'Connecting...';
            boolDisconnect := false;
            boolConnect := false;

            StatusBar.Panels[0].Text := 'AirPort modem: ' + stringModemStatus;
            StatusBar.Panels[1].Text := 'Speed:';
            StatusBar.Panels[2].Text := 'Time:';

            // Animate the icon.
            ImageListIcons.GetIcon( intCurrentIcon, TrayIcon.Icon );
            intCurrentIcon := intCurrentIcon + 1;
            if ( intCurrentIcon > 2 ) then intCurrentIcon := 0;
        end
        else if ( intConnected = 3 ) then
        // Connecting to your ISP.
        begin
            TrayIcon.ToolTip := 'Connecting to your ISP';

            stringModemStatus := 'Connecting...';
            boolDisconnect := false;
            boolConnect := false;

            StatusBar.Panels[0].Text := 'AirPort modem: ' + stringModemStatus;
            StatusBar.Panels[1].Text := 'Speed:';
            StatusBar.Panels[2].Text := 'Time:';

            // Animate the icon.
            ImageListIcons.GetIcon( intCurrentIcon, TrayIcon.Icon );
            intCurrentIcon := intCurrentIcon + 1;
            if ( intCurrentIcon > 2 ) then intCurrentIcon := 0;
        end
        else if ( intConnected = 4 ) then
        // Connected with time.
        begin
            TrayIcon.ToolTip := stringTime;

            stringModemStatus := 'Connected';
            boolConnect := false;
            boolDisconnect := true;

            StatusBar.Panels[0].Text := 'AirPort modem: ' + stringModemStatus;
            StatusBar.Panels[1].Text := 'Speed: ' + IntToStr( intSpeed ) + ' bps';
            StatusBar.Panels[2].Text := 'Time: ' + stringTime;

            ImageListIcons.GetIcon( 3, TrayIcon.Icon );
        end
        else if ( intConnected = 5 ) then
        // Disabled.  Waiting for modem to reset.
        begin
            TrayIcon.ToolTip := 'Waiting for Modem to reset';

            stringModemStatus := 'Not connected';
            boolDisconnect := false;
            boolConnect := false;

            StatusBar.Panels[0].Text := 'AirPort modem: ' + stringModemStatus;
            StatusBar.Panels[1].Text := 'Speed:';
            StatusBar.Panels[2].Text := 'Time:';

            // Animate the icon.
            ImageListIcons.GetIcon( intCurrentIcon, TrayIcon.Icon );
            intCurrentIcon := intCurrentIcon - 1;
            if ( intCurrentIcon < 0 ) then intCurrentIcon := 2;
        end
        else
     // Default.
        begin
            TrayIcon.ToolTip := 'Not connected';

            stringModemStatus := 'Not connected';
            boolDisconnect := false;
            boolConnect := true;

            StatusBar.Panels[0].Text := 'AirPort modem: ' + stringModemStatus;
            StatusBar.Panels[1].Text := 'Speed:';
            StatusBar.Panels[2].Text := 'Time:';

            ImageListIcons.GetIcon( 3, TrayIcon.Icon );
        end;

    except

        TrayIcon.ToolTip := 'Network failure';

        stringModemStatus := 'Network failure';
        boolDisconnect := false;
        boolConnect := false;

        StatusBar.Panels[0].Text := 'AirPort modem: ' + stringModemStatus;
        StatusBar.Panels[1].Text := 'Speed:';
        StatusBar.Panels[2].Text := 'Time:';

        ImageListIcons.GetIcon( 5, TrayIcon.Icon );

    end;

end;

procedure TFormMain.ButtonCancelClick(Sender: TObject);
begin
    FormMain.Visible := false;
end;

procedure TFormMain.ButtonOKClick(Sender: TObject);
begin
    FormMain.Visible := false;
    stringAirPortAddress := EditAddress.Text;
    SaveSettings();
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
    stringModemStatus := 'Unavailable';
    boolConnect := false;
    boolDisconnect := false;
    LoadSettings();
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
    EditAddress.Text := stringAirPortAddress;
    ButtonApply.Enabled := false;
end;

procedure TFormMain.EditAddressChange(Sender: TObject);
begin
    ButtonApply.Enabled := true;
end;

procedure TFormMain.SaveSettings();
var
    Registry: TRegistry;
begin

    // Write the settings down to the registry.
    Registry := TRegistry.Create;

    with Registry do begin
        try
            if OpenKey( '\Software\In7\InModem', true )
            then begin

            // Write the setting.
            Registry.WriteString( 'Address', stringAirPortAddress );

            end
        finally
            Registry.free;
        end;
    end;

end;

procedure TFormMain.LoadSettings();
var
    Registry: TRegistry;
begin

    // Set the default values.
    stringAirPortAddress := '10.0.1.1';

    // Write the settings down to the registry.
    Registry := TRegistry.Create;

    with Registry do begin
        try
            if OpenKey( '\Software\In7\InModem', false )
            then begin

            // Write the setting.
            stringAirPortAddress := Registry.ReadString( 'Address' );

            end
        finally
            Registry.free;
        end;
    end;

end;

procedure TFormMain.ButtonApplyClick(Sender: TObject);
begin

    stringAirPortAddress := EditAddress.Text;


end;

procedure TFormMain.UdpClientStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
    StatusBar.Panels[0].Text := 'Error';
end;

procedure TFormMain.MenuAboutClick(Sender: TObject);
begin
    FormAbout.Visible := true;
end;

procedure TFormMain.PopupMenuPopup(Sender: TObject);
begin
    MenuStatus.Caption := 'AirPort modem: ' + stringModemStatus;
    MenuDisconnect.Enabled := boolDisconnect;
    MenuConnect.Enabled := boolConnect;
end;

end.
