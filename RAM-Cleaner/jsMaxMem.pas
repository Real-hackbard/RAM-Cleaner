{$WARNINGS OFF}
{$HINTS OFF}
{$R-}
unit jsMaxMem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons;

type
  TOnProgress = procedure(Sender: TObject;Progress:Integer) of object;

  TjsMaxMem = class(TComponent)
  private
    FAbort             : Boolean;
    FTotalMemory       : Integer; { Your Computer RAM in Bytes }
    FWorking           : Boolean;
    FOnProgress        : TOnProgress;
    FOnBeforeDefrag    ,
    FOnAfterDefrag     : TNotifyEvent;
    Function GetFreeMemory:Integer; { In Bytes }
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   DefragMemory(MemoryLimit:Integer); { Watchout! In MEGABYTES }
    Procedure   Abort;
    Procedure   DefragAll;
  published
    property    TotalMemory : Integer Read FTotalMemory;
    property    FreeMemory  : Integer Read GetFreeMemory;

    { Events }
    property    OnBeforeDefrag : tNotifyEvent Read FOnBeforeDefrag Write FOnBeforeDefrag;
    property    OnProgress  : TOnProgress Read FOnProgress Write FOnProgress;
    property    OnAfterDefrag : tNotifyEvent Read FOnAfterDefrag Write FOnAfterDefrag;
  end;

procedure Register;

implementation

uses Unit1;

constructor TjsMaxMem.Create(AOwner: TComponent);
var MS : tMemoryStatus;
Begin
  inherited Create(AOwner);
  MS.dwLength:=sizeof(MS);
  GlobalMemoryStatus(MS);
  FTotalMemory:=MS.dwTotalPhys;
End;

destructor TjsMaxMem.Destroy;
Begin
  inherited Destroy;
End;

Procedure TjsMaxMem.Abort;
Begin
  FAbort:=True;
End;


Procedure TjsMaxMem.DefragAll;
Begin
  case Form1.RadioGroup1.ItemIndex of
  0 : DefragMemory(TotalMemory div (1024*1024));
  1 : DefragMemory(TotalMemory div (2048*2048));
  2 : DefragMemory(TotalMemory div (4096*4096));
  3 : DefragMemory(TotalMemory div (8192*8192));
  end;
End;

Function TjsMaxMem.GetFreeMemory:Integer;
var MS : tMemoryStatus;
Begin
  MS.dwLength:=sizeof(MS);
  GlobalMemoryStatus(MS);
  Result:=MS.dwAvailPhys;
End;

procedure TjsMaxMem.DefragMemory(MemoryLimit:Integer);
var
 Pointers : Array [0..1024] of Pointer;
 Limit    ,
 I2,
 I        : Integer;
 P        : Pointer;
 Step     : Integer;
 Steps    : Integer;
begin
 FAbort := False;
 If FWorking then Exit;
 FWorking:=True;
 Limit:=MemoryLimit;
 If Limit>1024 then Limit:=1024;
 If Assigned(FOnBeforeDefrag) then FOnBeforeDefrag(Self);
 { Calculating how many steps...}
 Steps:=(MemoryLimit*2);

 Step:=0;

 { Clean pointer...}
 For I:= 0 to Limit do Pointers[I]:=nil;

 { Allocating Memory }
 For I:=0 to Limit-1 do
 Begin
  P:=VirtualAlloc(nil, 1024*1024, MEM_COMMIT, PAGE_READWRITE + PAGE_NOCACHE);
  Pointers[I]:=p;
  asm
   pushad
   pushfd
   mov   edi, p
   mov   ecx, 1024*1024/4
   xor   eax, eax
   cld
   repz  stosd
   popfd
   popad
  end;
  Inc(Step);
  If Assigned(FOnProgress) then OnProgress(Self,Round((Step/Steps)*100));
  If FAbort then
  Begin
    For I2:=0 to I do
    Begin
     VirtualFree(Pointers[I2], 0, MEM_RELEASE);
    End;
    Step:=(MemoryLimit*2);
    FWorking:=False;
    If Assigned(FOnAfterDefrag) then FOnAfterDefrag(Self);
    Exit;
  End;
 end;

 { DeAllocating Memory }

 For I:=0 to Limit-1 do
 Begin
  VirtualFree(Pointers[i], 0, MEM_RELEASE);
  Inc(Step);
  If Assigned(FOnProgress) then OnProgress(Self,Round((Step/Steps)*100));
  If FAbort then
  Begin
    { Warning! : Force abort, w/o de-allocating memory }    
    Step:=(MemoryLimit*2);
    FWorking:=False;
    If Assigned(FOnAfterDefrag) then FOnAfterDefrag(Self);
    Exit;
  End;
 End;

 FWorking:=False;
 If Assigned(FOnAfterDefrag) then FOnAfterDefrag(Self);
 Form1.StatusBar1.Panels[0].Text := 'Process finish.';
 Form1.Button2.Click;
 Form1.BitBtn1.Enabled := true;
 Form1.BitBtn2.Enabled := false;
 Screen.Cursor := crDefault;
End;


procedure Register;
begin
  RegisterComponents('hackbard', [TjsMaxMem]);
end;

end.
 