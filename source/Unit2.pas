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

unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TFormAbout = class(TForm)
    ButtonAboutOK: TButton;
    Bevel1: TBevel;
    Image1: TImage;
    procedure ButtonAboutOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.DFM}

procedure TFormAbout.ButtonAboutOKClick(Sender: TObject);
begin
    FormAbout.Visible := false;
end;

end.
