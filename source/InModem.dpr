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

program InModem;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FormMain},
  Unit2 in 'Unit2.pas' {FormAbout};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'InModem';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.ShowMainForm := false;
  Application.Run;
end.
