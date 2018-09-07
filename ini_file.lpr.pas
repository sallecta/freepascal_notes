program inifile;
{$mode objfpc}{$H+}

uses
  classes, sysutils, IniFiles;
const
  INI_Section = 'DB INFO';
 var
  INI_fn, INI_Key: string;
  INI_obj: TINIFile;
  Author, Pass, DBFile: String; MaxAttempts: integer;
begin
  INI_fn := 'subdir' + DirectorySeparator + 'main.ini';
  if not FileExists(INI_fn) then begin writeln('no file');exit;end;

  {Create the object, specifying the the INI_obj file that contains
  the settings}
  INI_obj := TINIFile.Create(INI_fn);
  {Put reading the INI_obj file inside a try/finally block
  to prevent memory leaks}
  try
    if not INI_obj.SectionExists(INI_Section) then
    begin writeln('no section');exit;end;

    // Demonstrates reading values from the INI_obj file.
    // ValueExists actually check if Key exists
    INI_Key := 'Author';
    if not INI_obj.ValueExists(INI_Section, INI_Key) then begin
      writeln(INI_Key, ' not exist.');exit; end;
    Author      := INI_obj.ReadString(INI_Section,INI_Key,'');

    INI_Key := 'Pass';
    if not INI_obj.ValueExists(INI_Section, INI_Key) then begin
      writeln(INI_Key, ' not exist.');exit; end;
    Pass      := INI_obj.ReadString(INI_Section,INI_Key,'');

    INI_Key := 'DBFile';
    if not INI_obj.ValueExists(INI_Section, 'DBFile') then begin
      writeln(INI_Key, ' not exist.');exit; end;
    DBFile      := INI_obj.ReadString(INI_Section,INI_Key,'');

    INI_Key := 'MaxAttempts';
    if not INI_obj.ValueExists(INI_Section, INI_Key) then begin
      writeln(INI_Key, ' not exist.');exit; end;
    MaxAttempts      := INI_obj.ReadInteger(INI_Section,INI_Key,-1);

    writeln('Author               : ', Author);
    writeln('File                 : ', DBFile);
    writeln('Password             : ', Pass);
    writeln('Max password attempts: ', MaxAttempts);

  finally
    {After the INI_obj file was used it must be freed
    to prevent memory leaks.}
    INI_obj.Free;
  end;

  //write section-key-value(string) to ini file
  INI_obj := TINIFile.Create(INI_fn);
  try
    INI_obj.WriteString(INI_Section,'DBFile','D:\DATA\base.fdb');
	finally
    INI_obj.Free;
	end;

end.
