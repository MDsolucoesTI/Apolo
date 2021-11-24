//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RXCtrls, fcImage, fcimageform, StdCtrls, RxDBComb,
  Grids, BaseGrid, AdvGrid, TFlatMemoUnit, ComCtrls, fcButton, fcImgBtn,
  Mask, EDateEd, EHintBal, ELibFnc, ImgList, DCStdCtrls, Menus, RxMenus;

type
  TFrmAgenda = class(TForm)
    fcImageForm2: TfcImageForm;
    Image1: TImage;
    RxLabel4: TRxLabel;
    ImageList1: TImageList;
    Bevel1: TBevel;
    RxDBComboBox1: TRxDBComboBox;
    DCPageControl1: TDCPageControl;
    DCPage2: TDCPage;
    StringProced: TAdvStringGrid;
    DCPage1: TDCPage;
    StringAgenda: TAdvStringGrid;
    Calendario: TMonthCalendar;
    Bevel2: TBevel;
    RxPopupMenu1: TRxPopupMenu;
    Imprimir1: TMenuItem;
    EvLibFunctions1: TEvLibFunctions;
    Shape5: TShape;
    Label5: TLabel;
    Shape3: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Shape4: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Label1: TLabel;
    Shape1: TShape;
    RxLabel1: TRxLabel;
    dbTel1: TEdit;
    RxLabel3: TRxLabel;
    dbTel2: TEdit;
    RxLabel5: TRxLabel;
    meData: TEvDateEdit;
    RxLabel2: TRxLabel;
    MemoObs: TFlatMemo;
    btnAgendar: TfcImageBtn;
    btnDesmarcar: TfcImageBtn;
    btnEncaixe: TfcImageBtn;
    btnBloqueio: TfcImageBtn;
    btnConfirmar: TfcImageBtn;
    btnEspera: TfcImageBtn;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    AgendarPaciente1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure CalendarioClick(Sender: TObject);
    procedure StringAgendaClick(Sender: TObject);
    procedure StringProcedClick(Sender: TObject);
    procedure StringAgendaDblClick(Sender: TObject);
    procedure StringProcedDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgenda: TFrmAgenda;
  data : TDateTime;

implementation

uses UnitDmdados, UnitMarcarCons, UnitMarcProced;

{$R *.dfm}

procedure TFrmAgenda.FormShow(Sender: TObject);
var
   c:integer;
begin
  {calendario.Date:=date;
  RxLabel4.Caption:=IntTostr(Day(data))+' de '+MonthName(data)+' de '+IntToStr(Year(data));
  StringAgenda.Cells[0,0]:='Hora';
  StringAgenda.Cells[1,0]:='Pacientes';
  StringAgenda.Cells[2,0]:='Conv�nio';
  StringAgenda.Cells[3,0]:='S';
  StringAgenda.Cells[4,0]:='Tipo';
  StringAgenda.Cells[0,1]:='8:00';
  StringAgenda.Cells[0,2]:='8:15';
  StringAgenda.Cells[0,3]:='8:30';
  StringAgenda.Cells[0,4]:='8:45';
  StringAgenda.Cells[0,5]:='9:00';
  StringAgenda.Cells[0,6]:='9:15';
  StringAgenda.Cells[0,7]:='9:30';
  StringAgenda.Cells[0,8]:='9:45';
  StringAgenda.Cells[0,9]:='10:00';
  StringAgenda.Cells[0,10]:='10:15';
  StringAgenda.Cells[0,11]:='10:30';
  StringAgenda.Cells[0,12]:='10:45';
  StringAgenda.Cells[0,13]:='11:00';
  StringAgenda.Cells[0,14]:='11:15';
  StringAgenda.Cells[0,15]:='11:30';
  StringAgenda.Cells[0,16]:='12:00';
  StringAgenda.Cells[0,17]:='13:00';
  StringAgenda.Cells[0,18]:='13:30';
  StringAgenda.Cells[0,19]:='13:45';
  StringAgenda.Cells[0,20]:='14:00';
  StringAgenda.Cells[0,21]:='14:15';
  StringAgenda.Cells[0,22]:='14:30';
  StringAgenda.Cells[0,23]:='14:45';
  StringAgenda.Cells[0,24]:='15:00';
  StringAgenda.Cells[0,25]:='15:15';
  StringAgenda.Cells[0,26]:='15:30';
  StringAgenda.Cells[0,27]:='15:45';
  StringAgenda.Cells[0,28]:='16:00';
  StringAgenda.Cells[0,29]:='16:15';
  StringAgenda.Cells[0,30]:='16:30';
  StringAgenda.Cells[0,31]:='16:45';
  StringAgenda.Cells[0,32]:='17:00';
  StringAgenda.Cells[0,33]:='17:15';
  StringAgenda.Cells[0,34]:='17:30';
  StringAgenda.Cells[0,35]:='17:45';
  StringAgenda.Cells[0,36]:='18:00';

  StringProced.Cells[0,0]:='Hora';
  StringProced.Cells[1,0]:='Pacientes';
  StringProced.Cells[2,0]:='Sess�o';
  StringProced.Cells[3,0]:='Status';
  StringProced.Cells[0,1]:='8:00';
  StringProced.Cells[0,2]:='8:15';
  StringProced.Cells[0,3]:='8:30';
  StringProced.Cells[0,4]:='8:45';
  StringProced.Cells[0,5]:='9:00';
  StringProced.Cells[0,6]:='9:15';
  StringProced.Cells[0,7]:='9:30';
  StringProced.Cells[0,8]:='9:45';
  StringProced.Cells[0,9]:='10:00';
  StringProced.Cells[0,10]:='10:15';
  StringProced.Cells[0,11]:='10:30';
  StringProced.Cells[0,12]:='10:45';
  StringProced.Cells[0,13]:='11:00';
  StringProced.Cells[0,14]:='11:15';
  StringProced.Cells[0,15]:='11:30';
  StringProced.Cells[0,16]:='12:00';
  StringProced.Cells[0,17]:='13:00';
  StringProced.Cells[0,18]:='13:30';
  StringProced.Cells[0,19]:='13:45';
  StringProced.Cells[0,20]:='14:00';
  StringProced.Cells[0,21]:='14:15';
  StringProced.Cells[0,22]:='14:30';
  StringProced.Cells[0,23]:='14:45';
  StringProced.Cells[0,24]:='15:00';
  StringProced.Cells[0,25]:='15:15';
  StringProced.Cells[0,26]:='15:30';
  StringProced.Cells[0,27]:='15:45';
  StringProced.Cells[0,28]:='16:00';
  StringProced.Cells[0,29]:='16:15';
  StringProced.Cells[0,30]:='16:30';
  StringProced.Cells[0,31]:='16:45';
  StringProced.Cells[0,32]:='17:00';
  StringProced.Cells[0,33]:='17:15';
  StringProced.Cells[0,34]:='17:30';
  StringProced.Cells[0,35]:='17:45';
  StringProced.Cells[0,36]:='18:00';
  data:=Date;
  //limpa as informa��es do StringGrid
  for c:=1 to StringAgenda.RowCount-1 do
    begin
    StringAgenda.Cells[1,c]:='';
    StringAgenda.Cells[2,c]:='';
    StringAgenda.Cells[3,c]:='';
    StringAgenda.Cells[4,c]:='';
    end;
  //transfere os dados da tabela para o StringGrid
  with dmdados do
    begin
    TbAgenda.Filtered:=false;
    TbAgenda.Filter:='(Data = '''+DateToStr(data)+''')';
    TbAgenda.Filtered:=True;
    TbAgenda.First;
    while not dmdados.TbAgenda.Eof do
      begin
      for c:=1 to StringAgenda.RowCount-1 do
        if tbAgendaHora.Value=StrToTime(StringAgenda.Cells[0,c]) then
          begin
          if TbAgendaTipo.value='1a Vez' then
            begin
            FrmAgenda.StringAgenda.FontColors[1,c]:=clgreen;
            FrmAgenda.StringAgenda.FontColors[2,c]:=clgreen;
            FrmAgenda.StringAgenda.FontColors[3,c]:=clgreen;
            FrmAgenda.StringAgenda.FontColors[4,c]:=clgreen;
            end;
          if TbAgendaTipo.value='Nova' then
            begin
            FrmAgenda.StringAgenda.FontColors[1,c]:=clBlue;
            FrmAgenda.StringAgenda.FontColors[2,c]:=clBlue;
            FrmAgenda.StringAgenda.FontColors[3,c]:=clBlue;
            FrmAgenda.StringAgenda.FontColors[4,c]:=clBlue;
            end;
          if TbAgendaTipo.value='Retorno' then
            begin
            FrmAgenda.StringAgenda.FontColors[1,c]:=clred;
            FrmAgenda.StringAgenda.FontColors[2,c]:=clred;
            FrmAgenda.StringAgenda.FontColors[3,c]:=clred;
            FrmAgenda.StringAgenda.FontColors[4,c]:=clred;
            end;          
          StringAgenda.Cells[1,c]:=tbAgendaPaciente.Value;
          StringAgenda.Cells[2,c]:=tbAgendaLkConvenio.Value;
          StringAgenda.Cells[3,c]:=tbAgendaStatus.Value;
          StringAgenda.Cells[4,c]:=tbAgendaTipo.Value;
          end;
      TbAgenda.Next;
      end;
    //Para o StringProced
    for c:=1 to StringProced.RowCount-1 do
    begin
    StringProced.Cells[1,c]:='';
    StringProced.Cells[2,c]:='';
    StringProced.Cells[3,c]:='';
    end;
  //transfere os dados da tabela para o StringGrid
    TbAgeProced.Filtered:=false;
    TbAgeProced.Filter:='(Data = '''+DateToStr(data)+''')';
    TbAgeProced.Filtered:=True;
    TbAgeProced.First;
    while not dmdados.TbAgeProced.Eof do
      begin
      for c:=1 to StringProced.RowCount-1 do
        if tbAgendaHora.Value=StrToTime(StringProced.Cells[0,c]) then
          begin
          StringProced.Cells[1,c]:=tbAgeProcedPaciente.Value;
          StringProced.Cells[2,c]:=IntToStr(tbAgeProcedlksecAtual.Value);
          StringProced.Cells[3,c]:=tbAgeProcedStatus.Value;
          end;
      TbAgeProced.Next;
      end; 
end; }
end;

procedure TFrmAgenda.btnSairClick(Sender: TObject);
begin
  CLose;
end;

procedure TFrmAgenda.CalendarioClick(Sender: TObject);
var
  c:integer;
begin
  //Recua a data em um dia
  data:=calendario.Date;
  RxLabel4.Caption:=IntTostr(Day(data))+' de '+MonthName(data)+' de '+IntToStr(Year(data));
  //limpa as informa��es do StringGrid
  for c:=1 to StringAgenda.RowCount-1 do
    begin
    StringAgenda.Cells[1,c]:='';
    StringAgenda.Cells[2,c]:='';
    StringAgenda.Cells[3,c]:='';
    StringAgenda.Cells[4,c]:='';
    end;
  //transfere os dados da tabela para o StringGrid
  with dmdados do
    begin
    TbAgenda.Filtered:=false;
    TbAgenda.Filter:='(Data = '''+DateToStr(data)+''')';
    TbAgenda.Filtered:=True;
    TbAgenda.First;
    while not dmdados.TbAgenda.Eof do
      begin
      for c:=1 to StringAgenda.RowCount-1 do
        if tbAgendaHora.Value=StrToTime(StringAgenda.Cells[0,c]) then
          begin
          if TbAgendaTipo.value='1a Vez' then
            begin
            FrmAgenda.StringAgenda.FontColors[1,c]:=clgreen;
            FrmAgenda.StringAgenda.FontColors[2,c]:=clgreen;
            FrmAgenda.StringAgenda.FontColors[3,c]:=clgreen;
            FrmAgenda.StringAgenda.FontColors[4,c]:=clgreen;
            end;
          if TbAgendaTipo.value='Nova' then
            begin
            FrmAgenda.StringAgenda.FontColors[1,c]:=clBlue;
            FrmAgenda.StringAgenda.FontColors[2,c]:=clBlue;
            FrmAgenda.StringAgenda.FontColors[3,c]:=clBlue;
            FrmAgenda.StringAgenda.FontColors[4,c]:=clBlue;
            end;
          if TbAgendaTipo.value='Retorno' then
            begin
            FrmAgenda.StringAgenda.FontColors[1,c]:=clred;
            FrmAgenda.StringAgenda.FontColors[2,c]:=clred;
            FrmAgenda.StringAgenda.FontColors[3,c]:=clred;
            FrmAgenda.StringAgenda.FontColors[4,c]:=clred;
            end;
          StringAgenda.Cells[1,c]:=tbAgendaPaciente.Value;
          StringAgenda.Cells[2,c]:=tbAgendaLkConvenio.Value;
          StringAgenda.Cells[3,c]:=tbAgendaStatus.Value;
          StringAgenda.Cells[4,c]:=tbAgendaTipo.Value;
          end;
      TbAgenda.Next;
      end;
    //Para o StringProced
    for c:=1 to StringProced.RowCount-1 do
    begin
    StringProced.Cells[1,c]:='';
    StringProced.Cells[2,c]:='';
    StringProced.Cells[3,c]:='';
    end;
  //transfere os dados da tabela para o StringGrid
    TbAgeProced.Filtered:=false;
    TbAgeProced.Filter:='(Data = '''+DateToStr(data)+''')';
    TbAgeProced.Filtered:=True;
    TbAgeProced.First;
    while not dmdados.TbAgeProced.Eof do
      begin
      for c:=1 to StringProced.RowCount-1 do
        if tbAgeProcedHora.Value=StrToTime(StringProced.Cells[0,c]) then
          begin
          StringProced.Cells[1,c]:=tbAgeProcedPaciente.Value;
          StringProced.Cells[2,c]:=IntToStr(tbAgeProcedlksecAtual.Value);
          StringProced.Cells[3,c]:=tbAgeProcedStatus.Value;
          end;
      TbAgeProced.Next;
      end;
    end;

end;

procedure TFrmAgenda.StringAgendaClick(Sender: TObject);
var
linha:integer;
begin
linha:=FrmAgenda.StringAgenda.Row;
If FrmAgenda.StringAgenda.Cells[1,linha]='' then
  Begin
  dbTel1.Text:= '';
  dbTel2.Text:= '';
  medata.Text:= '';
  MemoObs.Text:= '';
  end
else
  Begin
  if dmdados.TbAgenda.Locate('Paciente',FrmAgenda.StringAgenda.Cells[1,linha],[])Then
    Begin
    dbtel1.Text:= dmdados.TbAgendaTel1.Value;
    dbtel2.Text:= dmdados.TbAgendaTel2.Value;
    MemoObs.Text:= dmdados.TbAgendaObs.value;
    end;
  if dmdados.tbUltCons.Locate('Paciente',FrmAgenda.StringAgenda.Cells[1,linha],[]) then
    begin
    meData.Text:=dmdados.TbUltConsData.AsString;
    end;
  end;

end;

procedure TFrmAgenda.StringProcedClick(Sender: TObject);
var
linha:integer;
Begin
  linha:=FrmAgenda.StringProced.Row;
  if frmAgenda.StringProced.Cells[1,linha]='' then
  Begin
  dbTel1.Text:= '';
  dbTel2.Text:= '';
  medata.Text:= '';
  MemoObs.Text:= '';
  end
else
  Begin
//  DMdados.tbAgeProced.Locate('hora',StrToTime(StringProced.Cells[0,StringProced.Row]),[]);
  if dmdados.TbAgeProced.Locate('Paciente',FrmAgenda.StringProced.Cells[1,linha],[])Then
    Begin
    dbtel1.Text:= dmdados.tbAgeProcedTel1.Value;
    dbtel2.Text:= dmdados.tbAgeProcedTel2.Value;
    MemoObs.Text:= dmdados.tbAgeProcedObs.value;
    end;
  end;

end;

procedure TFrmAgenda.StringAgendaDblClick(Sender: TObject);
begin
FrmMarcarCons:=TFrmMarcarCons.create(application);
FrmMarcarCons.Showmodal;
StringAgendaClick(Sender);
end;

procedure TFrmAgenda.StringProcedDblClick(Sender: TObject);
begin
FrmMarcProced:=TFrmMarcProced.create(application);
FrmMarcProced.Showmodal;
StringProcedClick(Sender);
end;

procedure TFrmAgenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmAgenda.FormCreate(Sender: TObject);
begin
  data:=date;
end;

end.
