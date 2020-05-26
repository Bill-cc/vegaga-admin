unit untIniIO;

interface

uses
  Classes, SysUtils, IniFiles, Forms, Windows;

const
  csIniDataConfigSection = 'DataConfig';

  {Section: DataConfig}
  csIniDataConfigserverAddr = 'serverAddr';
  csIniDataConfigserverName = 'serverName';
  csIniDataConfigserverPort = 'serverPort';
  csIniDataConfiguserName = 'userName';
  csIniDataConfigpassword = 'password';

type
  TIniOptions = class(TObject)
  private
    {Section: DataConfig}
    FDataConfigserverAddr: string;
    FDataConfigserverName: string;
    FDataConfigserverPort: string;
    FDataConfiguserName: string;
    FDataConfigpassword: string;
  public
    procedure LoadSettings(Ini: TIniFile);
    procedure SaveSettings(Ini: TIniFile);

    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);

    {Section: DataConfig}
    property DataConfigserverAddr: string read FDataConfigserverAddr write FDataConfigserverAddr;
    property DataConfigserverName: string read FDataConfigserverName write FDataConfigserverName;
    property DataConfigserverPort: string read FDataConfigserverPort write FDataConfigserverPort;
    property DataConfiguserName: string read FDataConfiguserName write FDataConfiguserName;
    property DataConfigpassword: string read FDataConfigpassword write FDataConfigpassword;
  end;

var
  IniOptions: TIniOptions = nil;

implementation

procedure TIniOptions.LoadSettings(Ini: TIniFile);
begin
  if Ini <> nil then
  begin
    {Section: DataConfig}
    FDataConfigserverAddr := Ini.ReadString(csIniDataConfigSection, csIniDataConfigserverAddr, '10.21.1.230');
    FDataConfigserverName := Ini.ReadString(csIniDataConfigSection, csIniDataConfigserverName, 'vegaga');
    FDataConfigserverPort := Ini.ReadString(csIniDataConfigSection, csIniDataConfigserverPort, '3306');
    FDataConfiguserName := Ini.ReadString(csIniDataConfigSection, csIniDataConfiguserName, 'root');
    FDataConfigpassword := Ini.ReadString(csIniDataConfigSection, csIniDataConfigpassword, 'root');
  end;
end;

procedure TIniOptions.SaveSettings(Ini: TIniFile);
begin
  if Ini <> nil then
  begin
    {Section: DataConfig}
    Ini.WriteString(csIniDataConfigSection, csIniDataConfigserverAddr, FDataConfigserverAddr);
    Ini.WriteString(csIniDataConfigSection, csIniDataConfigserverName, FDataConfigserverName);
    Ini.WriteString(csIniDataConfigSection, csIniDataConfigserverPort, FDataConfigserverPort);
    Ini.WriteString(csIniDataConfigSection, csIniDataConfiguserName, FDataConfiguserName);
    Ini.WriteString(csIniDataConfigSection, csIniDataConfigpassword, FDataConfigpassword);
  end;
end;

procedure TIniOptions.LoadFromFile(const FileName: string);
var
  Ini: TIniFile;
begin
  if FileExists(FileName) then
  begin
    Ini := TIniFile.Create(FileName);
    try
      LoadSettings(Ini);
    finally
      Ini.Free;
    end;
  end;
end;

procedure TIniOptions.SaveToFile(const FileName: string);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    SaveSettings(Ini);
  finally
    Ini.Free;
  end;
end;

initialization
  IniOptions := TIniOptions.Create;

finalization
  IniOptions.Free;

end.

 