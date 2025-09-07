unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, IniFiles, ExtCtrls, jsMaxMem, Spin, Menus,
  ShellApi, tlhelp32, psAPI, cxPC, Filectrl, XPMan;

type

  TPanel = class(ExtCtrls.TPanel)
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
    end;

  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    CheckBox1: TCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    jsMaxMem1: TjsMaxMem;
    Timer1: TTimer;
    Timer2: TTimer;
    PopupMenu1: TPopupMenu;
    DefragmentMem1: TMenuItem;
    Minimize1: TMenuItem;
    Maximize1: TMenuItem;
    N1: TMenuItem;
    Close1: TMenuItem;
    Label10: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Label15: TLabel;
    Label14: TLabel;
    CheckBox8: TCheckBox;
    Label16: TLabel;
    Label17: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Label18: TLabel;
    ProgressBar2: TProgressBar;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    Button2: TButton;
    Label30: TLabel;
    procedure intervalle(temps:cardinal);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure jsMaxMem1BeforeDefrag(Sender: TObject);
    procedure jsMaxMem1AfterDefrag(Sender: TObject);
    procedure jsMaxMem1Progress(Sender: TObject; Progress: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure DefragmentMem1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
  private
    { Déclarations privées }
    procedure DebugProcessStatus(s: string);
  public
    { Déclarations publiques }
  end;
  
var
  Form1: TForm1;
  dhakera: integer;
  ramini :TIniFile;

type
  TMemoryStatusEx = packed record
    dwLength: DWORD;
    dwMemoryLoad: DWORD;
    ullTotalPhys: Int64;
    ullAvailPhys: Int64;
    ullTotalPageFile: Int64;
    ullAvailPageFile: Int64;
    ullTotalVirtual: Int64;
    ullAvailVirtual: Int64;
    ullAvailExtendedVirtual: Int64;
end;

type
  TMemoryManager = record
    GetMem: function(Size: Integer): Pointer;
    FreeMem: function(P: Pointer): Integer;
    ReallocMem: function(P: Pointer; Size: Integer): Pointer;
end;

implementation

{$R *.DFM}
procedure TPanel.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 0;
end;

procedure TForm1.DebugProcessStatus(s: string);
var
  pmc: PPROCESS_MEMORY_COUNTERS;
  cb: Integer;
  MemStat: tMemoryStatus;
  NewWorkingMemory, OldWorkingMemory : Longint;
begin
  MemStat.dwLength := SizeOf(MemStat);
  GlobalMemoryStatus(MemStat);

  // Get the total and available system memory
  //TotalMemoryLabel.Caption := 'Total system memory: ' +
   // FormatFloat('###,###', MemStat.dwTotalPhys / 1024) + ' KByte';
  //FreeMemoryLabel.Caption  := 'Free physical memory: ' +
   // FormatFloat('###,###', MemStat.dwAvailPhys / 1024) + ' KByte';

  // Get the used memory for the current process
  cb := SizeOf(TProcessMemoryCounters);
  GetMem(pmc, cb);
  pmc^.cb := cb;
  
  if GetProcessMemoryInfo(GetCurrentProcess(), pmc, cb) then
  begin
    NewWorkingMemory           := Longint(pmc^.WorkingSetSize);
    Label4.Caption := 'Current Process      : ' +
      FormatFloat('###,###', NewWorkingMemory / 1024) + ' KByte';
    Label18.Caption := FormatFloat('###,###', (NewWorkingMemory - OldWorkingMemory) / 1024) + ' KByte';
    OldWorkingMemory           := NewWorkingMemory;
  end;
  FreeMem(pmc);
end;

function GlobalMemoryStatusEx(var lpBuffer: TMemoryStatusEx): BOOL; stdcall;
type
  TFNGlobalMemoryStatusEx = function(var msx: TMemoryStatusEx): BOOL; stdcall;
var
  FNGlobalMemoryStatusEx: TFNGlobalMemoryStatusEx;
begin
  FNGlobalMemoryStatusEx := TFNGlobalMemoryStatusEx(
    GetProcAddress(GetModuleHandle(kernel32), 'GlobalMemoryStatusEx'));
  if not Assigned(FNGlobalMemoryStatusEx) then
  begin
    SetLastError(ERROR_CALL_NOT_IMPLEMENTED);
    Result := False;
  end
  else
    Result := FNGlobalMemoryStatusEx(lpBuffer);
end;

procedure TForm1.intervalle(temps:Cardinal);
var
 tempsD: Cardinal;
begin
 tempsD:=GetTickCount;
 repeat
  Application.ProcessMessages;
 until ((GetTickCount -tempsD)>=Temps);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Memo1.Clear;
  StatusBar1.Panels[0].Text := 'Clean start...';

  if(SpinEdit2.value) < dhakera
    then
    jsMaxMem1.DefragAll
    else
  jsMaxMem1.DefragMemory(SpinEdit2.value);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
   jsMaxMem1.Abort;
   StatusBar1.Panels[0].Text := 'Clean stop!';
   Screen.Cursor := crDefault;
end;

procedure TForm1.jsMaxMem1BeforeDefrag(Sender: TObject);
begin
   BitBtn1.Enabled:=False;
   BitBtn2.Enabled:=true;
   Timer1.Enabled:=False;
   ProgressBar1.Visible:=true;
end;

procedure TForm1.jsMaxMem1AfterDefrag(Sender: TObject);
begin
   Sleep(100);
   BitBtn1.Enabled := true;
   BitBtn2.Enabled := False;
   Timer1.Enabled := true;
   ProgressBar1.Position := 0;
end;

procedure TForm1.jsMaxMem1Progress(Sender: TObject; Progress: Integer);
begin
 ProgressBar1.Position := Progress;
 Label8.Caption := 'Progress : ' + IntToStr(ProgressBar1.Position) + ' %';
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
   Wakt: Cardinal;
   sec,min,hour: integer;
   ssec,smin,shour: string;
begin
   Wakt:=GetTickCount;
   sec:=Wakt div 1000 mod 60;
   min:=Wakt div 1000 div 60 mod 60;
   hour:=Wakt div 1000 div 60 div 60 mod 24;

   if sec > 9 then ssec := IntToStr(sec)
   else ssec := '0' + IntToStr(sec);

   if min > 9  then smin := IntToStr(min)
   else smin := '0' + IntToStr(min);

   if hour>9 then shour := IntToStr(hour)
   else shour := '0' + IntToStr(hour);

   StatusBar1.Panels[2].Text := shour+':' + smin + ':' +
                                ssec + ' | ' + Timetostr(Time);

   if CheckBox10.Checked = true then begin
   DebugProcessStatus('');
   end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var  Status: TMemoryStatusEx;
     MemoryStatus: TMemoryStatus;
     msgC, msgS : string;
begin
  if CheckBox2.Checked = true then begin
  ZeroMemory(@Status, SizeOf(TMemoryStatusEx));
  end;

  Status.dwLength := SizeOf(TMemoryStatusEx);
  GlobalMemoryStatusEx(Status);

  Dhakera:=jsMaxMem1.FreeMemory div (1024*1024) ;

   Label10.Caption:='Free Memory: '+ IntToStr(Status.ullAvailPhys div 1024) + ' bytes';
   Label2.Caption := 'Total RAM            : ' + IntToStr(Status.ullTotalPhys div 1024) + ' bytes' +
                     ' - (' + IntToStr(Status.ullTotalPhys div 1000000000)+ 'GB)';

   if CheckBox3.Checked = true then begin
   Label5.Caption := 'Available RAM        : ' + IntToStr(Status.ullAvailPhys div 1024) + ' bytes' +
                     ' - (' + IntToStr(Status.ullAvailPhys div 1000000000)+ 'GB)';
   end else begin
   Label5.Caption := 'Available RAM        : ' + '0' + ' bytes';
   end;

   if CheckBox4.Checked = true then begin
   Label9.Caption := 'Total Pagefile       : ' + IntToStr(Status.ullTotalPageFile div 1024) + ' bytes' +
                     ' - (' + IntToStr(Status.ullTotalPageFile div 1000000000)+ 'GB)';
   end else begin
   Label9.Caption := 'Total Pagefile       : ' + '0' + ' bytes';
   end;

   if CheckBox5.Checked = true then begin
   Label11.Caption := 'Available Pagefile   : ' + IntToStr(Status.ullAvailPageFile div 1024) + ' bytes' +
                      ' - (' + IntToStr(Status.ullAvailPageFile div 1000000000)+ 'GB)';
   end else begin
   Label11.Caption := 'Available Pagefile   : ' + '0' + ' bytes';
   end;

   if CheckBox6.Checked = true then begin
   Label12.Caption := 'Total Virtual        : ' + IntToStr(Status.ullTotalVirtual div 1024) + ' bytes' +
                      ' - (' + IntToStr(Status.ullTotalVirtual div 1000000000)+ 'GB)';
   end else begin
   Label12.Caption := 'Total Virtual        : ' + '0' + ' bytes';
   end;

   if CheckBox7.Checked = true then begin
   Label13.Caption := 'Available Virtual    : ' + IntToStr(Status.ullAvailVirtual div 1024) + ' bytes' +
                      ' - (' + IntToStr(Status.ullAvailVirtual div 1000000000)+ 'GB)';
   end else begin
   Label13.Caption := 'Available Virtual    : ' + '0' + ' bytes';
   end;

   with MemoryStatus do begin
   MemoryStatus.dwLength := SizeOf(MemoryStatus) ;
   GlobalMemoryStatus(MemoryStatus);
   Label16.Caption := 'Usage Memory : ' + IntToStr(dwMemoryLoad) + '%';
   ProgressBar2.Position :=  dwMemoryLoad;
   Label17.Caption := 'Data Structure       : ' + IntToStr(dwLength) + ' bytes';
   end;

  if CheckBox8.Checked = true then begin
      if AllocMemCount > 0 then
      begin
        Str (AllocMemCount, msgC);
        msgC := msgC;
        Label14.Caption := 'Memory Leak Count    : ' + PChar(msgC) + ' Blocks';
      end;

      if AllocMemSize > 0 then
      begin
        Str (AllocMemSize, msgS);
        msgS := msgS;
        Label15.Caption := 'Memory Leak Size     : ' + PChar(msgS) + ' Bytes';
      end;

      end else begin
      Label14.Enabled := false;
      Label14.Caption := 'Memory Leak Count    : 0 Blocks';
      Label15.Enabled := false;
      Label15.Caption := 'Memory Leak Size     : 0 Bytes';
  end;

  Panel1.DoubleBuffered := true;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
    Status: TMemoryStatusEx;
    Process: THandle;
    Mbi: TMemoryBasicInformation;
    Filename: array [0..MAX_PATH] of Char;
    Txt: string;
begin
  Panel1.DoubleBuffered := true;

  ZeroMemory(@Status, SizeOf(TMemoryStatusEx));
  Status.dwLength := SizeOf(TMemoryStatusEx);
  GlobalMemoryStatusEx(Status);
  {
  Label2.Caption :=  'Total RAM            : ' + IntToStr(Status.ullTotalPhys div 1024) + ' Kb';
  Label5.Caption :=  'Available RAM        : ' + IntToStr(Status.ullAvailPhys div 1024) + ' Kb';
  Label9.Caption :=  'Total Pagefile       : ' + IntToStr(Status.ullTotalPageFile div 1024) + ' Kb';
  Label11.Caption := 'Available Pagefile   : ' + IntToStr(Status.ullAvailPageFile div 1024) + ' Kb';
  Label12.Caption := 'Total Virtuell       : ' + IntToStr(Status.ullTotalVirtual div 1024) + ' Kb';
  Label13.Caption := 'Available Virtuell   : ' + IntToStr(Status.ullAvailVirtual div 1024) + ' Kb';
   }
  Form1.TabSheet1.Show;
  BitBtn2.Enabled:=False;
  RamIni:=TiniFile.Create(changeFileExt(Application.exename,'.ini'));
 try
  SpinEdit2.Value:=RamIni.ReadInteger('options','trytofree',640);
  SpinEdit3.Value:=RamIni.ReadInteger('Options','delay',20);
  CheckBox1.Checked:=RamIni.ReadBool('options','autodefrag',false) ;
  CheckBox3.Checked:=RamIni.ReadBool('options','Available',false) ;
  CheckBox4.Checked:=RamIni.ReadBool('options','Pagefile',false) ;
  CheckBox5.Checked:=RamIni.ReadBool('options','AvailablePagefile',false) ;
  CheckBox6.Checked:=RamIni.ReadBool('options','TotalVirtuel',false) ;
  CheckBox7.Checked:=RamIni.ReadBool('options','AvailableVirtuel',false) ;
  CheckBox8.Checked:=RamIni.ReadBool('options','MemLeak',false) ;
  CheckBox9.Checked:=RamIni.ReadBool('options','VirtualEx',false) ;
  CheckBox10.Checked:=RamIni.ReadBool('options','DebugProcess',false) ;
  CheckBox2.Checked:=RamIni.ReadBool('options','Zero',false) ;
  Scrollbar1.Position:=RamIni.ReadInteger('options','Mem',Scrollbar1.Position) ;
  Scrollbar2.Position:=RamIni.ReadInteger('options','Debug',Scrollbar2.Position) ;
 finally
  RamIni.Free;
 end;

  Memo1.Clear();
  Process := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_OPERATION or
  PROCESS_VM_READ, False, GetCurrentProcessId()); // ...use your target
  if Process <> 0 then
  try
    Mbi.BaseAddress := nil;
    while (VirtualQueryEx(Process, Mbi.BaseAddress, Mbi,
    SizeOf(TMemoryBasicInformation)) > 0) and (Mbi.RegionSize > 0) do
    begin
      if (Mbi.State <> MEM_FREE) then
      begin

      if CheckBox9.Checked = true then begin
      Label21.Caption := 'Virtual Commit       : ' + IntToStr(MEM_COMMIT) + ' bytes' +
                         ' - (' + IntToStr((MEM_COMMIT) div 1000) + 'MB)';
      Label22.Caption := 'Virtual Reserve      : ' + IntToStr(MEM_RESERVE) + ' bytes' +
                         ' - (' + IntToStr((MEM_RESERVE) div 1000) + 'MB)';
      Label23.Caption := 'Virtual Decommit     : ' + IntToStr(MEM_DECOMMIT) + ' bytes' +
                         ' - (' + IntToStr((MEM_DECOMMIT) div 1000) + 'MB)';
      Label24.Caption := 'Virtual Release      : ' + IntToStr(MEM_RELEASE) + ' bytes' +
                         ' - (' + IntToStr((MEM_RELEASE) div 1000) + 'MB)';
      Label25.Caption := 'Virtual Free         : ' + IntToStr(MEM_FREE) + ' bytes' +
                         ' - (' + IntToStr((MEM_FREE) div 1000) + 'MB)';
      Label26.Caption := 'Virtual Private      : ' + IntToStr(MEM_PRIVATE) + ' bytes' +
                         ' - (' + IntToStr((MEM_PRIVATE) div 1000) + 'MB)';
      Label27.Caption := 'Virtual Mapped       : ' + IntToStr(MEM_MAPPED) + ' bytes' +
                         ' - (' + IntToStr((MEM_MAPPED) div 1000) + 'MB)';
      Label28.Caption := 'Virtual Reset        : ' + IntToStr(MEM_RESET) + ' bytes' +
                         ' - (' + IntToStr((MEM_RESET) div 1000) + 'MB)';
      Label29.Caption := 'Virtual Top Down     : ' + IntToStr(MEM_TOP_DOWN) + ' bytes' +
                         ' - (' + IntToStr((MEM_TOP_DOWN) div 1000) + 'MB)';
      end;

        // range
        Txt := IntToHex(Cardinal(Mbi.BaseAddress), 8) + '-' +
        IntToHex(Cardinal(Mbi.BaseAddress) + Mbi.RegionSize, 8);
        // state
        if Mbi.State = MEM_COMMIT then Txt := Txt + ' [commited]'
        else
        if Mbi.State = MEM_RESERVE then Txt := Txt + ' [reserved]';
        // type
        if Mbi.Type_9 = MEM_IMAGE then Txt := Txt + ' (image)'
        else if Mbi.Type_9 = MEM_MAPPED then
          Txt := Txt + ' (mapped)'
        else if Mbi.Type_9 = MEM_PRIVATE then Txt := Txt + ' (private)';
          // ...AllocationProtect
          // ...Protect

          // try to get image name (uses PSApi - WinNT only)
          // (requires PROCESS_VM_READ)
        if GetModuleFileNameEx(Process, HINST(Mbi.AllocationBase),
          Filename, MAX_PATH) > 0 then
          Txt := Txt + ' - ' + Filename;
        Memo1.Lines.Add(Txt);
      end;
      Inc(Cardinal(Mbi.BaseAddress), Mbi.RegionSize);
    end;
  finally
    CloseHandle(Process);
    StatusBar1.Panels[1].Text := 'Memory Address : ' +IntToStr(Memo1.Lines.Count);
  end;

  Application.HintPause := 0;
  Application.HintHidePause := 50000;
  Label2.Hint := 'Maximum Memory capacity';
  Label5.Hint := 'Free available Memory';
  Label9.Hint := 'Total available System PageFile';
  Label11.Hint := 'Free available PageFile';
  Label12.Hint := 'Maximum available Virtual Memory';
  Label13.Hint := 'Free available Virtual Memory';
  Label14.Hint := 'Memory leak is the unintentional and ongoing consumption of Memory by a' + #13#10 +
                  'Program that is no longer needed, eventually leading to performance' + #13#10 +
                  'degradation and application crashes. You can detect a leak by monitoring' + #13#10 +
                  'increasing Memory usage over time in graphs, checking the rise in PerfMon' + #13#10 +
                  'counters like Committed Bytes or Private Bytes, or by seeing a consistent' + #13#10 +
                  'increase in the size of the Pagefile.';
  Label15.Hint := 'Memory leaks size isnt a fixed value, its the amount of RAM a program' + #13#10 +
                  'continuously consumes without releasing it, leading to gradually increasing' + #13#10 +
                  'Memory usage that can eventually slow down, bug out, or crash your System.';
  Label17.Hint := 'Data structures are generally based on the ability of a Computer' + #13#10 +
                  'to fetch and store data at any place in its Memory, specified by a' + #13#10 +
                  'pointer—a bit string, representing a Memory address, that can' + #13#10 +
                  'be itself stored in Memory and manipulated by the program.';
  Label4.Hint  := 'To see the size of your current running process';
  Label18.Hint := 'This shows the amount of data loss the current process has experienced during' + #13#10 +
                  'runtime. An identical value for the current process indicates no data loss.' + #13#10 +
                  'If the values of the "Current Process" do not match the' + #13#10 +
                  'Memory Loss, the process will not run stable and will lose Data.';
  Label21.Hint := 'In the context of computer memory management, "virtual commit" refers to the' + #13#10 +
                  'Memory Manager reserving a portion of an applications virtual address space' + #13#10 +
                  'and guaranteeing that it will be backed by physical memory (RAM) or a page' + #13#10 +
                  'file (a disk-based file) when needed.';
  Label22.Hint := 'Memory virtual Reserve is an area in a processs virtual address space' + #13#10 +
                  'that is Reserved by the Operating System but does not yet map' + #13#10 +
                  'to physical Memory.';
  Label23.Hint := 'Virtual Decommit refers to releasing blocks of virtual Memory that are no' + #13#10 +
                  'longer in use back to the operating System, freeing up space on the hard' + #13#10 +
                  'drive. This process, sometimes used by System-level Memory Managers to' + #13#10 +
                  'handle fragmentation, allows the System to regain control of unused Memory' + #13#10 +
                  'pages that were allocated but are no longer needed by an Application.';
  Label24.Hint := 'Memory Virtual Release can refer to the Operating System freeing up Disk Space' + #13#10 +
                  'when it is no longer needed, or to an Operation within an application that no' + #13#10 +
                  'longer allocates virtual Memory and thus returns it to the Operating System.';
  Label25.Hint := 'Memory Virtual Free refers to the available virtual memory on a computer,' + #13#10 +
                  'which is RAM plus a portion of the hard drive used to extend RAM.';
  Label26.Hint := 'Memory Virtual Private refers to the combination of Virtual Memory and a' + #13#10 +
                  'Virtual Private Server (VPS), where virtual memory is a technique using' + #13#10 +
                  'storage to expand physical RAM, and a VPS is a virtualized server offering' + #13#10 +
                  'dedicated, isolated resources like memory (RAM) to a user.';
  Label27.Hint := 'Memory-Mapped file is a section of a processs virtual' + #13#10 +
                  'Memory that has a direct, byte-for-byte correlation with' + #13#10 +
                  'a file on disk or another resource, such as a device or sha-' + #13#10 +
                  'red Memory object.';
  Label28.Hint := 'To reset virtual Memory in Windows, go to System Properties, navigate to the' + #13#10 +
                  'Performance Options window, and then in the Virtual Memory section, check' + #13#10 +
                  'the box for "Automatically manage paging file size for all drives".';
  Label29.Hint := 'Memory virtual top down function refers to a function that allocates virtual' + #13#10 +
                  'Memory from the higher end of an address space, often with the goal of' + #13#10 +
                  'Reserving the top 32-bits of the address space or supporting specific needs like' + #13#10 +
                  'an automatically wrapping ring Buffer.';

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 RamIni:=TiniFile.Create(changeFileExt(Application.exename,'.ini'));
 try
  RamIni.writeInteger('options','trytofree',SpinEdit2.Value);
  RamIni.writeInteger('Options','delay',SpinEdit3.Value);
  RamIni.writeBool('options','autodefrag',checkbox1.checked) ;
  RamIni.writeBool('options','Available',checkbox3.checked) ;
  RamIni.writeBool('options','Pagefile',checkbox4.checked) ;
  RamIni.writeBool('options','AvailablePagefile',checkbox5.checked) ;
  RamIni.writeBool('options','TotalVirtuel',checkbox6.checked) ;
  RamIni.writeBool('options','AvailableVirtuel',checkbox7.checked) ;
  RamIni.writeBool('options','MemLeak',checkbox8.checked) ;
  RamIni.writeBool('options','VirtualEx',checkbox9.checked) ;
  RamIni.writeBool('options','DebugProcess',checkbox10.checked) ;
  RamIni.writeBool('options','Zero',checkbox2.checked) ;
  RamIni.writeInteger('options','Mem',ScrollBar1.Position) ;
  RamIni.writeInteger('options','Debug',ScrollBar2.Position) ;
 finally
  RamIni.Free;
 end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 if(checkBox1.Checked=true) and (round(dhakera) < Spinedit2.value)
 then
  begin
   repeat
    jsMaxMem1.DefragMemory(SpinEdit2.Value);
    Label10.Caption:='Free Memory: ' + FloatToStr(0)+' MB.';
   until true
  end;
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.DefragmentMem1Click(Sender: TObject);
begin
 if(spinedit2.value)<dhakera
 then
  begin
   jsMaxMem1.DefragAll;
   Label10.Caption:='Free Memory: '+floattostr(0)+' MB.';
  end
 else
  begin
   jsMaxMem1.DefragMemory(spinedit2.value);
   Label10.Caption:='Free Memory: '+floattostr(0)+' MB.';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Process: THandle;
  Mbi: TMemoryBasicInformation;
  Filename: array [0..MAX_PATH] of Char;
  Txt: string;
begin
  StatusBar1.SetFocus;
  Screen.Cursor := crHourGlass;
  StatusBar1.Panels[0].Text := 'Refresh Leaks..';
  Application.ProcessMessages;
  Memo1.Clear();
  Process := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_OPERATION or
  PROCESS_VM_READ, False, GetCurrentProcessId()); // ...use your target
  if Process <> 0 then
  try
    Mbi.BaseAddress := nil;
    while (VirtualQueryEx(Process, Mbi.BaseAddress, Mbi,
    SizeOf(TMemoryBasicInformation)) > 0) and (Mbi.RegionSize > 0) do
    begin
      if (Mbi.State <> MEM_FREE) then
      begin
        // range
        Txt := IntToHex(Cardinal(Mbi.BaseAddress), 8) + '-' +
        IntToHex(Cardinal(Mbi.BaseAddress) + Mbi.RegionSize, 8);
        // state
        if Mbi.State = MEM_COMMIT then
          Txt := Txt + ' [commited]'
        else if Mbi.State = MEM_RESERVE then
          Txt := Txt + ' [reserved]';
        // type
        if Mbi.Type_9 = MEM_IMAGE then
          Txt := Txt + ' (image)'
        else if Mbi.Type_9 = MEM_MAPPED then
          Txt := Txt + ' (mapped)'
        else if Mbi.Type_9 = MEM_PRIVATE then
          Txt := Txt + ' (private)';
          // ...AllocationProtect
          // ...Protect

          // try to get image name (uses PSApi - WinNT only)
          // (requires PROCESS_VM_READ)
        if GetModuleFileNameEx(Process, HINST(Mbi.AllocationBase),
          Filename, MAX_PATH) > 0 then
          Txt := Txt + ' - ' + Filename;

        Memo1.Lines.Add(Txt);
      end;
      Inc(Cardinal(Mbi.BaseAddress), Mbi.RegionSize);
    end;
  finally
    CloseHandle(Process);
    StatusBar1.Panels[0].Text := 'ready.';
    StatusBar1.Panels[1].Text := 'Memory Address : ' +IntToStr(memo1.Lines.Count);
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.CheckBox9Click(Sender: TObject);
var
  i : integer;

begin
  if CheckBox9.Checked = true then begin

  for i := 18 to 29 do begin
  if Form1.Components[i] is TLabel then
    TLabel(Form1.Components[i]).Enabled := true;
  end;

  Label21.Caption := 'Virtual Commit       : ' + IntToStr(MEM_COMMIT) + ' bytes' +
                         ' - (' + IntToStr((MEM_COMMIT) div 1000) + 'MB)';
      Label22.Caption := 'Virtual Reserve      : ' + IntToStr(MEM_RESERVE) + ' bytes' +
                         ' - (' + IntToStr((MEM_RESERVE) div 1000) + 'MB)';
      Label23.Caption := 'Virtual Decommit     : ' + IntToStr(MEM_DECOMMIT) + ' bytes' +
                         ' - (' + IntToStr((MEM_DECOMMIT) div 1000) + 'MB)';
      Label24.Caption := 'Virtual Release      : ' + IntToStr(MEM_RELEASE) + ' bytes' +
                         ' - (' + IntToStr((MEM_RELEASE) div 1000) + 'MB)';
      Label25.Caption := 'Virtual Free         : ' + IntToStr(MEM_FREE) + ' bytes' +
                         ' - (' + IntToStr((MEM_FREE) div 1000) + 'MB)';
      Label26.Caption := 'Virtual Private      : ' + IntToStr(MEM_PRIVATE) + ' bytes' +
                         ' - (' + IntToStr((MEM_PRIVATE) div 1000) + 'MB)';
      Label27.Caption := 'Virtual Mapped       : ' + IntToStr(MEM_MAPPED) + ' bytes' +
                         ' - (' + IntToStr((MEM_MAPPED) div 1000) + 'MB)';
      Label28.Caption := 'Virtual Reset        : ' + IntToStr(MEM_RESET) + ' bytes' +
                         ' - (' + IntToStr((MEM_RESET) div 1000) + 'MB)';
      Label29.Caption := 'Virtual Top Down     : ' + IntToStr(MEM_TOP_DOWN) + ' bytes' +
                         ' - (' + IntToStr((MEM_TOP_DOWN) div 1000) + 'MB)';
   
  end else begin

  for i := 18 to 29 do begin
  if Form1.Components[i] is TLabel then
    TLabel(Form1.Components[i]).Enabled := false;
  end;

  Label21.Caption := 'Virtual Commit       : 0 bytes';
  Label22.Caption := 'Virtual Reserve      : 0 bytes';
  Label23.Caption := 'Virtual Decommit     : 0 bytes';
  Label24.Caption := 'Virtual Release      : 0 bytes';
  Label25.Caption := 'Virtual Free         : 0 bytes';
  Label26.Caption := 'Virtual Private      : 0 bytes';
  Label27.Caption := 'Virtual Mapped       : 0 bytes';
  Label28.Caption := 'Virtual Reset        : 0 bytes';
  Label29.Caption := 'Virtual Top Down     : 0 bytes';
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  CheckBox9.OnClick(sender);
  CheckBox3.OnClick(sender);
  CheckBox4.OnClick(sender);
  CheckBox5.OnClick(sender);
  CheckBox6.OnClick(sender);
  CheckBox7.OnClick(sender);
  CheckBox10.OnClick(sender);

end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked = true then begin
  Label9.Enabled := true;
  end else begin
  Label9.Enabled := false;
  Label9.Caption := 'Total Pagefile       : 0 bytes';
  end;
end;

procedure TForm1.CheckBox7Click(Sender: TObject);
begin
  if CheckBox7.Checked = true then begin
  Label13.Enabled := true;
  end else begin
  Label13.Enabled := false;
  Label13.Caption := 'Available Virtuel    : 0 bytes';
  end;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  if CheckBox5.Checked = true then begin
  Label11.Enabled := true;
  end else begin
  Label11.Enabled := false;
  Label11.Caption := 'Availlable Pagefile  : 0 bytes';
  end;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
  if CheckBox6.Checked = true then begin
  Label12.Enabled := true;
  end else begin
  Label12.Enabled := false;
  Label12.Caption := 'Total Virtuel       : 0 bytes';
  end;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked = true then begin
  Label5.Enabled := true;
  end else begin
  Label5.Enabled := false;
  Label5.Caption := 'Available RAM        : 0 bytes';
  end;
end;

procedure TForm1.CheckBox8Click(Sender: TObject);
begin
  if CheckBox8.Checked = true then begin
  Label14.Enabled := true;
  Label15.Enabled := true;
  end;
end;

procedure TForm1.CheckBox10Click(Sender: TObject);
begin
  if CheckBox10.Checked = true then begin
  Label4.Enabled := true;
  Label18.Enabled := true;
  Label30.Enabled := true;
  end else begin
  Label4.Enabled := false;
  Label18.Enabled := false;
  Label30.Enabled := false;
  Label4.Caption := 'Current Process      : 0 bytes';
  Label18.Caption :='0 bytes';
  end;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  Timer1.Interval := ScrollBar1.Position;
  Label19.Caption := 'Memory Scan : ' + IntToStr(ScrollBar1.Position) + ' (ms)';
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  Timer2.Interval := ScrollBar2.Position;
  Label20.Caption := 'Debug Process : ' + IntToStr(ScrollBar2.Position) + ' (ms)';
end;

end.
