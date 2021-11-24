//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitMarcarCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, RackCtls,
  SpeedBar, jpeg, fcButton, fcImgBtn, Animate, GIFCtrl, ToolEdit, RXDBCtrl,
  EDBTime, EDBFind, RxLookup, RxDBComb, DB, RxGrdCpt, fcImage, fcimageform,
  fcImager, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmMarcarCons = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel10: TRxLabel;
    Image1: TImage;
    LMDBackPanel3: TLMDBackPanel;
    btnConfirmar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel13: TRxLabel;
    dbData: TDBDateEdit;
    RxLabel8: TRxLabel;
    dbHora: TEvDBTimeEdit;
    RxLabel9: TRxLabel;
    dbcbTipo: TRxDBComboBox;
    RxLabel2: TRxLabel;
    dbNome: TDBEdit;
    RxLabel1: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel6: TRxLabel;
    lookConv: TRxDBLookupCombo;
    RxLabel3: TRxLabel;
    dbTel2: TDBEdit;
    RxLabel7: TRxLabel;
    dbObs: TDBMemo;
    RxLabel5: TRxLabel;
    dbCel: TDBEdit;
    EvDBFind1: TEvDBFind;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure EvDBFind1Exit(Sender: TObject);
    procedure EvDBFind1Enter(Sender: TObject);
    procedure dbcbTipoExit(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMarcarCons: TFrmMarcarCons;

implementation

uses UnitDmdados, UnitPrincipal, UnitAgenda;

{$R *.dfm}

procedure TFrmMarcarCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TFrmMarcarCons.BtnCancelarClick(Sender: TObject);
begin
  dmdados.TbAgenda.Cancel;
  Close;
end;

procedure TFrmMarcarCons.BtnConfirmarClick(Sender: TObject);
var
  linha:integer;
  prazo:integer;
  dtUltCons : tdatetime;
begin
  //filtrar para trazer ultima consulta
  if dbcbtipo.Text<>'1a Vez' then
    begin
    dmdados.TbUltCons.Filtered:=false;
    dmdados.tbUltCons.Filter:='(Paciente='''+dbnome.Text+''')';
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
    dmDados.TbAgenda.Post;
    if DMdados.TbPaciente.Locate('Nome',dbnome.Text,[loPartialKey]) then
     begin
     DMdados.TbPaciente.Edit;
     DMdados.TbPacienteConsMarca.Value:=DMdados.TbPacienteConsMarca.Value+1;
     DMdados.TbPaciente.Post;
     end;
    linha:=FrmAgenda.StringAgenda.Row;
    FrmAgenda.StringAgenda.Cells[1,linha]:= dmdados.TbAgendaPaciente.Value;
    FrmAgenda.StringAgenda.Cells[2,linha]:= dmdados.TbAgendaLkConvenio.Value;
    FrmAgenda.StringAgenda.Cells[3,linha]:=dmdados.tbagendaStatus.value;
    FrmAgenda.StringAgenda.Cells[4,linha]:= dmdados.TbAgendaTipo.Value;
    if dmDados.TbAgendaTipo.value='1a Vez' then
      begin
      FrmAgenda.StringAgenda.FontColors[1,linha]:=clgreen;
      FrmAgenda.StringAgenda.FontColors[2,linha]:=clgreen;
      FrmAgenda.StringAgenda.FontColors[3,linha]:=clgreen;
      FrmAgenda.StringAgenda.FontColors[4,linha]:=clgreen;
      end;
    if dmDados.TbAgendaTipo.value='Nova' then
      begin
      FrmAgenda.StringAgenda.FontColors[1,linha]:=clBlue;
      FrmAgenda.StringAgenda.FontColors[2,linha]:=clBlue;
      FrmAgenda.StringAgenda.FontColors[3,linha]:=clBlue;
      FrmAgenda.StringAgenda.FontColors[4,linha]:=clBlue;
      end;
    if dmDados.TbAgendaTipo.value='Retorno' then
      begin
      FrmAgenda.StringAgenda.FontColors[1,linha]:=clred;
      FrmAgenda.StringAgenda.FontColors[2,linha]:=clred;
      FrmAgenda.StringAgenda.FontColors[3,linha]:=clred;
      FrmAgenda.StringAgenda.FontColors[4,linha]:=clred;
      end;
  close;
end;

procedure TFrmMarcarCons.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : BtnCancelar.Click;
      Vk_END    : BtnConfirmar.Click;
    end;
end;

procedure TFrmMarcarCons.FormShow(Sender: TObject);
begin
  dmdados.TbPaciente.Close;
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Sair');
  dmdados.TbAgenda.Append;
  dmdados.TbAgendaHora.Value:=StrToTime(FrmAgenda.StringAgenda.Cells[0,FrmAgenda.StringAgenda.Row]);
  dmdados.TbAgendaData.Value:=frmAgenda.Calendario.Date;
  dmdados.tbagendaStatus.value:='A';
end;

procedure TFrmMarcarCons.EvDBFind1Exit(Sender: TObject);
begin
  if not dmdados.TbPaciente.Locate('Nome',EvDBFind1.Text,[LoPartialKey]) then
    begin
    ShowMessage('Paciente n�o cadastrado');
    EvDBFind1.SetFocus;
    end
  else
    begin
    dmdados.TbAgendaPaciente.Value:=EvDBFind1.Text;
    if dmdados.TbPaciente.Locate('Nome',EvDBFind1.Text,[]) then
      begin
      dmdados.TbAgendaTel1.Value:=dmdados.TbPacienteTel1.Value;
      dmdados.TbAgendaCodConv.Value:=dmdados.TbPacienteCodConv.Value;
      dmdados.TbAgendaTel2.Value:=dmdados.TbPacienteTel2.Value;
      dmdados.TbAgendaCelular.Value:=dmdados.TbPacienteCel.Value;
      dbObs.SetFocus;
      end;
    EvDBFind1.Visible:=false;
    end;
end;

procedure TFrmMarcarCons.EvDBFind1Enter(Sender: TObject);
begin
dmdados.TbPaciente.Open;
end;

procedure TFrmMarcarCons.dbcbTipoExit(Sender: TObject);
begin
if dbcbtipo.Text='1a Vez' then
   begin
   EvDBFind1.Visible:=false;
   dbnome.SetFocus;
   end
else
   Begin
   dbNome.Visible:= True;
   EvDBFind1.Visible:=true;
   dmdados.TbPaciente.Open;
   EvDBFind1.SetFocus;
   end;
end;

procedure TFrmMarcarCons.dbNomeExit(Sender: TObject);
begin
dmdados.TbPaciente.Open;
end;

end.
