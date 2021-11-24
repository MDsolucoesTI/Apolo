//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadConv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, RackCtls, SpeedBar,
  jpeg, RXSplit, fcButton, fcImgBtn, DCStdCtrls, ToolEdit, CurrEdit,
  RXDBCtrl, Grids, DBGrids, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, RxLookup , db, dbtables, EDBZero, RxGrdCpt, MrgMngr,
  fcImage, fcimageform, fcImager, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadConv = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    Image1: TImage;
    RxLabel8: TRxLabel;
    LMDBackPanel3: TLMDBackPanel;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    BtnNovo: TfcImageBtn;
    BtnGravar: TfcImageBtn;
    BtnCancelar: TfcImageBtn;
    BtnAlterar: TfcImageBtn;
    BtnDeletar: TfcImageBtn;
    BtnLocalizar: TfcImageBtn;
    BtnSair: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel1: TRxLabel;
    dbCod: TDBEdit;
    RxLabel2: TRxLabel;
    dbDesc: TDBEdit;
    RxLabel5: TRxLabel;
    dbPrazo: TDBEdit;
    RxLabel6: TRxLabel;
    lbnumero: TRxLabel;
    dbNum: TEvDBZeroEdit;
    CMBLKBAIRRO: TRxDBLookupCombo;
    lbBairro: TRxLabel;
    cmblkend: TRxDBLookupCombo;
    lbendereco: TRxLabel;
    lbcompl: TRxLabel;
    dbCompl: TDBEdit;
    RxLabel7: TRxLabel;
    dbCep: TDBEdit;
    dbUf: TDBComboBox;
    lbuf: TRxLabel;
    RxLabel3: TRxLabel;
    dbContato: TDBEdit;
    btnEnd: TfcImageBtn;
    btnBairro: TfcImageBtn;
    lbemail: TRxLabel;
    dbEmail: TDBEdit;
    BtnEmail: TfcImageBtn;
    Bevel3: TBevel;
    lbcidade: TRxLabel;
    cmbLkCidade: TRxDBLookupCombo;
    btnCidade: TfcImageBtn;
    RxLabel11: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel17: TRxLabel;
    dbTel2: TDBEdit;
    RxLabel24: TRxLabel;
    dbFax: TDBEdit;
    Bevel1: TBevel;
    RxLabel13: TRxLabel;
    dbDataCad: TDBDateEdit;
    procedure BtnSairClick(Sender: TObject);
    procedure btnEndClick(Sender: TObject);
    procedure btnBairroClick(Sender: TObject);
    procedure dbPrazoExit(Sender: TObject);
    procedure dbUfExit(Sender: TObject);
    procedure dbTel1Exit(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbDescExit(Sender: TObject);
   private
     { Private declarations }
     fconvenio:longint;
   public
    { Public declarations }
     Property Convenio:longint read fconvenio write fconvenio;
   end;

var
  FrmCadConv: TFrmCadConv;
  vtabStt: boolean;

implementation

uses UnitEnd, UnitCadBairro, UnitLocConv, UnitDmdados, UnitPrincipal;

{$R *.dfm}

procedure TFrmCadConv.BtnSairClick(Sender: TObject);
begin
  //convenio:=dmdados.TbConvenioCodConv.Value;
  Close;
end;

procedure TFrmCadConv.btnEndClick(Sender: TObject);
begin
if (dmdados.tbConvenio.State=dsedit)or(dmdados.tbConvenio.State=dsInsert) then
  begin
  FrmCadEnd:=TFrmCadEnd.create(application);
  FrmCadEnd.Showmodal;
  dmdados.TbConvenioCodEnd.Value:=FrmCadEnd.endereco;
  FrmCadEnd.free;
  end;
end;

procedure TFrmCadConv.btnBairroClick(Sender: TObject);
begin
if (dmdados.tbConvenio.State=dsedit)or(dmdados.tbConvenio.State=dsInsert) then
  begin
  FrmCadBairro:=TFrmCadBairro.create(application);
  FrmCadBairro.Showmodal;
  dmdados.TbConvenioCodBairro.Value:=frmcadbairro.bairro;
  frmcadbairro.free;
  end;
end;

procedure TFrmCadConv.dbPrazoExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbprazo.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o PRAZO DE RETORNO');
      dbPrazo.SetFocus;
      End;
    End;
end;

procedure TFrmCadConv.dbUfExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
Begin
  Flag:=True;
  For x:=0 to dbUF.Items.Count-1 Do
    If dbUF.Text=dbUF.Items[x] Then
      Flag:=False;
    If Flag Then
      Begin
      ShowMessage('ESTADO inv�lido!');
      dbUF.SetFocus;
      End;
end;

procedure TFrmCadConv.dbTel1Exit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbtel1.Text= '           ' then
      Begin
      ShowMessage('� obrigat�rio o TELEFONE 1');
      dbtel1.SetFocus;
      End;
    End;
end;

procedure TFrmCadConv.BtnLocalizarClick(Sender: TObject);
begin
  FrmLocConv:=TFrmLocConv.create(application);
  FrmLocConv.Showmodal;
end;

procedure TFrmCadConv.BtnPrimeiroClick(Sender: TObject);
begin
dmdados.TbConvenio.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TFrmCadConv.BtnAnteriorClick(Sender: TObject);
begin
dmdados.tbConvenio.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
If dmdados.TbConvenio.bof Then
 Begin
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
  End;
end;

procedure TFrmCadConv.BtnProximoClick(Sender: TObject);
begin
dmdados.tbConvenio.next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
If dmdados.tbConvenio.Eof Then
 Begin
 btnProximo.Enabled:=False;
 btnUltimo.Enabled:=False;
 end;

end;

procedure TFrmCadConv.BtnUltimoClick(Sender: TObject);
begin
dmdados.tbConvenio.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;

end;

procedure TFrmCadConv.BtnNovoClick(Sender: TObject);
begin
dmdados.tbConvenio.Append;
NovoItem:= True;
vTabStt:=False;
{habilitando os bot�es}
BtnGravar.Enabled := true;
BtnCancelar.Enabled:=true;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnAlterar.Enabled:=False;
BtnDeletar.Enabled:=False;
{habilitando os componentes}
dbdesc.Enabled:=true;
dbprazo.Enabled:=true;
cmblkend.Enabled:=true;
dbnum.Enabled:=true;
dbcompl.Enabled:=true;
cmblkbairro.Enabled:=true;
dbcep.Enabled:=true;
dbuf.Enabled:=true;
dbcontato.Enabled :=true;
dbtel1.Enabled:=true;
dbtel2.Enabled:=true;
dbfax.Enabled:=true;
dbdesc.setfocus;
end;

procedure TFrmCadConv.BtnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  vTabStt:= True;
  DMDados.TbConvenio.Cancel;
  BtnGravar.Enabled:=False;
  BtnCancelar.Enabled:=False;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnLocalizar.Enabled:=True;
  {desabilitando os componentes}
  dbdesc.Enabled:=false;
  dbprazo.Enabled:=false;
  cmblkend.Enabled:=false;
  dbnum.Enabled:=false;
  dbcompl.Enabled:=false;
  cmblkbairro.Enabled:=false;
  dbcep.Enabled:=false;
  dbuf.Enabled:=false;
  dbcontato.Enabled :=false;
  dbtel1.Enabled:=false;
  dbtel2.Enabled:=false;
  dbfax.Enabled:=false;
end;

procedure TFrmCadConv.BtnAlterarClick(Sender: TObject);
begin
NovoItem:=True;
vTabStt:= False;
DMDados.tbConvenio.Edit;
{habilitando os bot�es}
BtnCancelar.Enabled:=True;
BtnGravar.Enabled:=True;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnAlterar.Enabled:=False;
Btndeletar.Enabled:=False;
BtnLocalizar.Enabled:=False;

{habilitando os componentes}
dbdesc.Enabled:=true;
dbprazo.Enabled:=true;
cmblkend.Enabled:=true;
dbnum.Enabled:=true;
dbcompl.Enabled:=true;
cmblkbairro.Enabled:=true;
dbcep.Enabled:=true;
dbuf.Enabled:=true;
dbcontato.Enabled :=true;
dbtel1.Enabled:=true;
dbtel2.Enabled:=true;
dbfax.Enabled:=true;
dbdesc.setfocus;
end;

procedure TFrmCadConv.BtnDeletarClick(Sender: TObject);
begin
if dmdados.tbConvenio.RecordCount=0 then
   ShowMessage('Tabela vazia')
   else
If Application.MessageBox('Tem certeza que deseja excluir este Conv�nio ?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
    dmdados.tbConvenio.Delete;
    dmdados.tbConvenio.Refresh;
    end
    else
    DMDados.tbConvenio.cancel;
end;

procedure TFrmCadConv.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
begin
    Campos:='';
    Gravar:=True;
    Vazio:=False;

    // descri��o
    If dbdesc.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'DESCRI��O';
    Gravar:=False;
    Vazio:=True;
    end;

    // prazo
    If dbprazo.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'PRAZO DE RETORNO';
    Gravar:=False;
    Vazio:=True;
    end;

    // telefone 1
    If dbtel1.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'TELEFONE 1';
    Gravar:=False;
    Vazio:=True;
    end;

    If Gravar Then
    Begin
    DMDados.TbConvenio.Post;
    Convenio:=dmdados.TbConvenioCodConv.Value;
    NovoItem:=False;
    vTabStt:= True;
    BtnGravar.Enabled:=False;
    BtnCancelar.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    BtnLocalizar.Enabled:=True;
    {desabilitando os componentes}
    dbdesc.Enabled:=false;
    dbprazo.Enabled:=false;
    cmblkend.Enabled:=false;
    dbnum.Enabled:=false;
    dbcompl.Enabled:=false;
    cmblkbairro.Enabled:=false;
    dbcep.Enabled:=false;
    dbuf.Enabled:=false;
    dbcontato.Enabled :=false;
    dbtel1.Enabled:=false;
    dbtel2.Enabled:=false;
    dbfax.Enabled:=false;
    ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbdesc.SetFocus;
    end;

end;

procedure TFrmCadConv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TFrmCadConv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (vTabStt) then BtnNovo.Click;
      VK_Home   : if (vTabStt) then BtnAlterar.Click;
      VK_Delete : if (vTabStt) then BtnDeletar.Click;
      VK_End    : if not (vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not (vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F2     : btnEnd.Click;
      VK_F3     : btnBairro.Click;
      VK_F4     : BtnLocalizar.Click;
    end;
end;

procedure TFrmCadConv.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[F2] Endere�o [F3] Bairro [F4] Loc. Conv�nio [Esc] Cancelar ou Sair');
vTabStt:=True;
end;

procedure TFrmCadConv.dbDescExit(Sender: TObject);
var
  Tabela:TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.TbConvenio.DatabaseName;
    Tabela.TableName := dmDados.TbConvenio.TableName;
    Tabela.IndexName := dmdados.TbConvenio.IndexName;
    Tabela.Open;
    If dbdesc.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a DESCRI��O');
      dbdesc.SetFocus;
      End
    else
      Begin
      If Tabela.Locate('Desc',dbDesc.Text,[]) Then
        If not((DmDados.TbConvenio.State=dsEdit) And (dmDados.TbConvenio.RecNo = Tabela.RecNo)) Then
          Begin
          Showmessage('DESCRI��O j� Cadastrada');
          dbDesc.Clear;
          dbDesc.setfocus;
          End
      End;
    Tabela.Free;
    end;
end;
end.



