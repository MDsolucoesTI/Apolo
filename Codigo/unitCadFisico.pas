//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitCadFisico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SpeedBar, fcButton, fcImgBtn, RXCtrls, RackCtls, db,
  StdCtrls, jpeg, RxLookup, Mask, DBCtrls, Grids, DBGrids, RXDBCtrl,
  RXSplit, ToolEdit, RxGrdCpt, fcImage, fcimageform, fcImager,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadFisico = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    fcImager4: TfcImager;
    Image2: TImage;
    RxLabel4: TRxLabel;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel5: TRxLabel;
    dbCodPac: TDBEdit;
    RxLabel6: TRxLabel;
    dbPaciente: TDBEdit;
    fclLocCli: TfcImageBtn;
    dbData: TDBDateEdit;
    RxLabel7: TRxLabel;
    RxLabel3: TRxLabel;
    dbOssea: TDBComboBox;
    RxLabel2: TRxLabel;
    dbpeso: TDBEdit;
    RxLabel1: TRxLabel;
    dbaltura: TDBEdit;
    dbResultado: TDBText;
    RxLabel8: TRxLabel;
    RxDBGrid1: TRxDBGrid;
    LMDBackPanel3: TLMDBackPanel;
    fcImager2: TfcImager;
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
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure fclLocCliClick(Sender: TObject);
    procedure dbOsseaExit(Sender: TObject);
    procedure dbCodPacExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadFisico: TFrmCadFisico;
  novoItem:boolean;

implementation

uses UnitDmdados, unitLocPaciente, UnitPrincipal;

{$R *.dfm}

procedure TFrmCadFisico.BtnPrimeiroClick(Sender: TObject);
begin
dmdados.TbFisico.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TFrmCadFisico.BtnAnteriorClick(Sender: TObject);
begin
dmdados.tbFisico.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
If dmdados.TbFisico.bof Then
 Begin
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
  End;
end;

procedure TFrmCadFisico.BtnProximoClick(Sender: TObject);
begin
dmdados.tbFisico.next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
If dmdados.tbFisico.Eof Then
 Begin
 btnProximo.Enabled:=False;
 btnUltimo.Enabled:=False;
 end;
end;

procedure TFrmCadFisico.BtnUltimoClick(Sender: TObject);
begin
dmdados.tbFisico.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TFrmCadFisico.BtnNovoClick(Sender: TObject);
begin
dmdados.tbFisico.Append;
NovoItem:= True;
dmdados.vTabStt:= False;
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
dbData.Enabled:=true;
dbCodPac.Enabled:=true;
dbPaciente.Enabled:=true;
dbPeso.Enabled:=true;
dbAltura.Enabled:=true;
dbOssea.Enabled:=true;
dbData.SetFocus;
end;

procedure TFrmCadFisico.BtnGravarClick(Sender: TObject);
begin
DMDados.TbFisico.Post;
NovoItem:=False;
dmdados.vTabStt:= True;
BtnGravar.Enabled:=False;
BtnCancelar.Enabled:=False;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
Btndeletar.Enabled:=True;
dbData.Enabled:=false;
dbCodPac.Enabled:=false;
dbPaciente.Enabled:=false;
dbPeso.Enabled:=false;
dbAltura.Enabled:=false;
dbOssea.Enabled:=false;
ShowMessage('Dados gravados com sucesso');
end;

procedure TFrmCadFisico.BtnCancelarClick(Sender: TObject);
begin
dmdados.vTabStt:= True;
DMDados.tbFisico.Cancel;
BtnGravar.Enabled:=False;
BtnCancelar.Enabled:=False;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
dbData.Enabled:=false;
dbCodPac.Enabled:=false;
dbPaciente.Enabled:=false;
dbPeso.Enabled:=false;
dbAltura.Enabled:=false;
dbOssea.Enabled:=false;
end;

procedure TFrmCadFisico.BtnAlterarClick(Sender: TObject);
begin
if dmdados.TbFisico.RecordCount=0 then
   ShowMessage('Tabela vazia')
else
  begin
  NovoItem:=True;
  dmdados.vTabStt:=False;
  DMDados.tbFisico.Edit;
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
  dbData.Enabled:=true;
  dbCodPac.Enabled:=true;
  dbPaciente.Enabled:=true;
  dbPeso.Enabled:=true;
  dbAltura.Enabled:=true;
  dbOssea.Enabled:=true;
  dbData.SetFocus;
  end;
end;

procedure TFrmCadFisico.BtnDeletarClick(Sender: TObject);
begin
if dmdados.tbFisico.RecordCount=0 then
   ShowMessage('Tabela vazia')
   else
   begin
   If Application.MessageBox('Tem certeza que deseja excluir este Paciente ?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      begin
      dmdados.tbFisico.Delete;
      dmdados.tbFisico.Refresh;
      end
   else
      DMDados.tbFisico.cancel;
   end;
end;

procedure TFrmCadFisico.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadFisico.fclLocCliClick(Sender: TObject);
begin
if ((dmdados.tbFisico.State=dsEdit) or (dmdados.tbFisico.State=dsInsert)) then
   begin
   frmLocPaciente:=tfrmLocPaciente.create(application);
   frmLocPaciente.showModal;
   dmdados.tbFisicoCodPac.Value:=frmLocPaciente.Resultado;
   frmLocPaciente.Free;
   end;
end;

procedure TFrmCadFisico.dbOsseaExit(Sender: TObject);
var
 flag : boolean;
 x : integer;
begin
Flag:=True;
For x:=0 to dbOssea.Items.Count-1 Do
If dbOssea.Text=dbOssea.Items[x] Then
 Flag:=False;
If Flag Then
   Begin
   ShowMessage('Valor'+' '+dbOssea.Text+' '+'inv�lido');
    dbOssea.SetFocus;
    End;
end;

procedure TFrmCadFisico.dbCodPacExit(Sender: TObject);
begin
if NovoItem then
 begin
 if dbCodPac.Text='' then
    begin
    ShowMessage('Obrigat�rio informar o c�digo do paciente');
    dbCodPac.SetFocus;
    end
    else
 if not dmdados.tbPaciente.Locate('CodPac',dbCodPac.Text,[]) then
    begin
    showMessage('Paciente n�o cadastrado');
    dbcodPAc.SetFocus;
    end;
 END;
end;

procedure TFrmCadFisico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F2     : fclLocCli.Click;
    end;
end;

procedure TFrmCadFisico.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Localizar Cliente ');
  dmdados.vTabStt:= True;
end;

procedure TFrmCadFisico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

end.
