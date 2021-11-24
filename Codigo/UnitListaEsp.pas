//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitListaEsp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, RackCtls, SpeedBar, jpeg, ToolEdit,
  RXDBCtrl, fcButton, fcImgBtn, Mask, RXCtrls, Grids, DBGrids, EDBFind, DB,
  RxLookup, RxGrdCpt, fcImage, fcimageform, fcImager, CurrEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmListaEsp = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    LMDBackPanel3: TLMDBackPanel;
    BtnPrimeiro: TfcImageBtn;
    BtnAnterior: TfcImageBtn;
    BtnProximo: TfcImageBtn;
    BtnUltimo: TfcImageBtn;
    BtnNovo: TfcImageBtn;
    BtnGravar: TfcImageBtn;
    BtnCancelar: TfcImageBtn;
    BtnAlterar: TfcImageBtn;
    BtnDeletar: TfcImageBtn;
    BtnSair: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    dbPaciente: TDBEdit;
    RxLabel13: TRxLabel;
    dbData: TDBDateEdit;
    RxLabel2: TRxLabel;
    evdbfind1: TEvDBFind;
    RxLabel9: TRxLabel;
    dbTipo: TDBComboBox;
    RxLabel7: TRxLabel;
    lookMedico: TRxDBLookupCombo;
    lookConv: TRxDBLookupCombo;
    RxLabel6: TRxLabel;
    RxLabel1: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel3: TRxLabel;
    dbTel2: TDBEdit;
    RxLabel5: TRxLabel;
    dbCelular: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    Bevel1: TBevel;
    RxLabel8: TRxLabel;
    CurrencyEdit1: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAgendarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure dbPacienteExit(Sender: TObject);
    procedure dbTipoExit(Sender: TObject);
    procedure EvDBFind1Enter(Sender: TObject);
    procedure EvDBFind1Exit(Sender: TObject);
    procedure fcImageBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListaEsp: TFrmListaEsp;
  novoitem,vTabStt:boolean;
implementation

uses UnitMarcarCons, UnitDmdados, UnitPrincipal, UnitAgenda;

{$R *.dfm}

procedure TFrmListaEsp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TFrmListaEsp.BtnAgendarClick(Sender: TObject);
var
  linha:integer;
  prazo : integer;
  dtUltCons : tdatetime;
begin
  dmdados.TbPaciente.Open;
  linha:=FrmAgenda.StringAgenda.Row;
  dmdados.TbAgenda.Append;
  dmdados.TbAgendaHora.Value:=StrToTime(FrmAgenda.StringAgenda.Cells[0,linha]);
  dmdados.tbagendaStatus.value:='A';
  dmdados.TbAgendaData.Value:=frmAgenda.Calendario.Date;
  dmdados.TbAgendaPaciente.Value:=DMdados.TbHorarioPaciente.Value;
  dmdados.TbAgendaCodConv.Value:=DMdados.TbHorarioCodConv.Value;
  dmdados.TbAgendaTel1.Value:=DMdados.TbHorarioTel1.Value;
  dmdados.TbAgendaTel2.Value:=DMdados.TbHorarioTel2.Value;
  dmdados.TbAgendaCelular.Value:=DMdados.TbHorarioCel.Value;

   //filtrar para trazer ultima consulta
if dbtipo.Text<>'1a Vez' then
    begin
    dmdados.TbUltCons.Filtered:=false;
    dmdados.tbUltCons.Filter:='(Paciente='''+dbPaciente.Text+''')';
    dmdados.TbUltCons.Filtered:=true;
    dmdados.tbUltCons.First;
    if dmdados.tbUltCons.RecordCount > 0 then
      if dmdados.TbConvenio.Locate('Desc',lookConv.Text,[]) then
        begin
        prazo:=dmdados.TbConvenioPrazo.Value;
        if dmdados.tbUltConsData.Value > dmdados.TbAgendaData.value then
          begin
          ShowMessage('Paciente j� possue consulta marcada'+#13+'para o dia '+
                      DateToStr(dmdados.tbUltConsData.Value));
          dmdados.tbUltCons.Next;
          if dmdados.tbUltConsTipo.Value<>'Retorno' then
            begin
            dtUltCons:=dmdados.tbUltConsData.value+prazo;
            if dmdados.TbAgendaData.value<=dtUltCons then
              begin
              dmdados.TbAgendaTipo.Value:='Retorno';
              dmdados.tbUltCons.First;
              dmdados.tbUltCons.Edit;
              dmdados.tbUltConsTipo.Value:='Nova';
              dmdados.tbUltCons.Post;
              ShowMessage('O paciente est� com o prazo para retorno');
              end;
            end;
          end
        else
          begin
          if dmdados.tbUltConsTipo.Value<>'Retorno' then
            begin
            dtUltCons:=dmdados.tbUltConsData.value+prazo;
            if dmdados.TbAgendaData.value<=dtUltCons then
              begin
              dmdados.TbAgendaTipo.Value:='Retorno';
              ShowMessage('O paciente est� com o prazo para retorno');
              end;
            end;
          end;
      end;
    end;
  dmdados.TbAgenda.Post;
  dmdados.TbHorario.Delete;
  dmdados.TbHorario.Refresh;
  if DMdados.TbPaciente.Locate('Nome',dbPaciente.Text,[loPartialKey]) then
    begin
    DMdados.TbPaciente.Edit;
    DMdados.TbPacienteConsMarca.Value:=DMdados.TbPacienteConsMarca.Value+1;
    DMdados.TbPaciente.Post;
    end;
  FrmAgenda.StringAgenda.Cells[1,linha]:= dmdados.TbAgendaPaciente.Value;
  FrmAgenda.StringAgenda.Cells[2,linha]:= dmdados.TbAgendaLkConvenio.Value;
  FrmAgenda.StringAgenda.Cells[3,linha]:=dmdados.tbagendaStatus.value;
  FrmAgenda.StringAgenda.Cells[4,linha]:= dmdados.TbAgendaTipo.Value;
  FrmAgenda.StringAgenda.FontColors[1,linha]:=clBlue;
  FrmAgenda.StringAgenda.FontColors[2,linha]:=clBlue;
  FrmAgenda.StringAgenda.FontColors[3,linha]:=clBlue;
  FrmAgenda.StringAgenda.FontColors[4,linha]:=clBlue;
  close;
end;

procedure TFrmListaEsp.FormShow(Sender: TObject);
begin
  dmdados.TbPaciente.Close;
  FrmPrincipal.StatusTeclas(True,'[F2] Agendar [Esc] Sair');
  vTabStt:=True;
end;

procedure TFrmListaEsp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : BtnCancelar.Click;
    end;
end;

procedure TFrmListaEsp.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmListaEsp.dbPacienteExit(Sender: TObject);
begin
dmdados.TbPaciente.Open;
end;

procedure TFrmListaEsp.dbTipoExit(Sender: TObject);
begin
if dbtipo.Text='1a Vez' then
   begin
   EvDBFind1.Visible:=false;
   dbPaciente.SetFocus;
   end
else
   Begin
   dbPaciente.Visible:= True;
   EvDBFind1.Visible:=true;
   dmdados.TbPaciente.Open;
   EvDBFind1.SetFocus;
   end;
end;

procedure TFrmListaEsp.EvDBFind1Enter(Sender: TObject);
begin
dmdados.TbPaciente.Open;
end;

procedure TFrmListaEsp.EvDBFind1Exit(Sender: TObject);
begin
dmdados.TbHorarioPaciente.Value:=EvDBFind1.Text;
if dmdados.TbPaciente.Locate('Nome',EvDBFind1.Text,[]) then
  begin
  dmdados.TbHorarioTel1.Value:=dmdados.TbPacienteTel1.Value;
  dmdados.TbHorarioCodConv.Value:=dmdados.TbPacienteCodConv.Value;
  dmdados.TbHorarioTel2.Value:=dmdados.TbPacienteTel2.Value;
  dmdados.TbHorarioCel.Value:=dmdados.TbPacienteCel.Value;
  end;
EvDBFind1.Visible:=false;
end;

procedure TFrmListaEsp.fcImageBtn8Click(Sender: TObject);
var
  linha:integer;
  prazo : integer;
  dtUltCons : tdatetime;
begin
  dmdados.TbPaciente.Open;
  linha:=FrmAgenda.StringAgenda.Row;
  dmdados.TbAgenda.Append;
  dmdados.TbAgendaHora.Value:=StrToTime(FrmAgenda.StringAgenda.Cells[0,linha]);
  dmdados.tbagendaStatus.value:='A';
  dmdados.TbAgendaData.Value:=frmAgenda.Calendario.Date;
  dmdados.TbAgendaPaciente.Value:=DMdados.TbHorarioPaciente.Value;
  dmdados.TbAgendaCodConv.Value:=DMdados.TbHorarioCodConv.Value;
  dmdados.TbAgendaTel1.Value:=DMdados.TbHorarioTel1.Value;
  dmdados.TbAgendaTel2.Value:=DMdados.TbHorarioTel2.Value;
  dmdados.TbAgendaCelular.Value:=DMdados.TbHorarioCel.Value;

   //filtrar para trazer ultima consulta
if dbtipo.Text<>'1a Vez' then
    begin
    dmdados.TbUltCons.Filtered:=false;
    dmdados.tbUltCons.Filter:='(Paciente='''+dbPaciente.Text+''')';
    dmdados.TbUltCons.Filtered:=true;
    dmdados.tbUltCons.First;
    if dmdados.tbUltCons.RecordCount > 0 then
      if dmdados.TbConvenio.Locate('Desc',lookConv.Text,[]) then
        begin
        prazo:=dmdados.TbConvenioPrazo.Value;
        if dmdados.tbUltConsData.Value > dmdados.TbAgendaData.value then
          begin
          ShowMessage('Paciente j� possue consulta marcada'+#13+'para o dia '+
                      DateToStr(dmdados.tbUltConsData.Value));
          dmdados.tbUltCons.Next;
          if dmdados.tbUltConsTipo.Value<>'Retorno' then
            begin
            dtUltCons:=dmdados.tbUltConsData.value+prazo;
            if dmdados.TbAgendaData.value<=dtUltCons then
              begin
              dmdados.TbAgendaTipo.Value:='Retorno';
              dmdados.tbUltCons.First;
              dmdados.tbUltCons.Edit;
              dmdados.tbUltConsTipo.Value:='Nova';
              dmdados.tbUltCons.Post;
              ShowMessage('O paciente est� com o prazo para retorno');
              end;
            end;
          end
        else
          begin
          if dmdados.tbUltConsTipo.Value<>'Retorno' then
            begin
            dtUltCons:=dmdados.tbUltConsData.value+prazo;
            if dmdados.TbAgendaData.value<=dtUltCons then
              begin
              dmdados.TbAgendaTipo.Value:='Retorno';
              ShowMessage('O paciente est� com o prazo para retorno');
              end;
            end;
          end;
      end;
    end;
  dmdados.TbAgenda.Post;
  dmdados.TbHorario.Delete;
  dmdados.TbHorario.Refresh;
  if DMdados.TbPaciente.Locate('Nome',dbPaciente.Text,[loPartialKey]) then
    begin
    DMdados.TbPaciente.Edit;
    DMdados.TbPacienteConsMarca.Value:=DMdados.TbPacienteConsMarca.Value+1;
    DMdados.TbPaciente.Post;
    end;
  FrmAgenda.StringAgenda.Cells[1,linha]:= dmdados.TbAgendaPaciente.Value;
  FrmAgenda.StringAgenda.Cells[2,linha]:= dmdados.TbAgendaLkConvenio.Value;
  FrmAgenda.StringAgenda.Cells[3,linha]:=dmdados.tbagendaStatus.value;
  FrmAgenda.StringAgenda.Cells[4,linha]:= dmdados.TbAgendaTipo.Value;
  FrmAgenda.StringAgenda.FontColors[1,linha]:=clBlue;
  FrmAgenda.StringAgenda.FontColors[2,linha]:=clBlue;
  FrmAgenda.StringAgenda.FontColors[3,linha]:=clBlue;
  FrmAgenda.StringAgenda.FontColors[4,linha]:=clBlue;
  close;
end;

end.
