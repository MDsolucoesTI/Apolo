//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadPaciente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, fcShapeBtn, fcLabel, ExtCtrls, fcImage,db, dbTables,
  fcimageform, fcClearPanel, fcButtonGroup, ComCtrls, RxLookup, DBCtrls,
  ToolEdit, RXDBCtrl, StdCtrls, RxDBComb, Mask, RXCtrls, ShellApi, jpeg, EDBZero,
  RxGrdCpt, ExtDlgs, fcImager, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel, EWall;

type
  TFrmCadPaciente = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    RxLabel4: TRxLabel;
    Image2: TImage;
    Panel3: TLMDBackPanel;
    BtnPrimeiro: TfcImageBtn;
    BtnAnterior: TfcImageBtn;
    BtnProximo: TfcImageBtn;
    BtnUltimo: TfcImageBtn;
    BtnNovo: TfcImageBtn;
    BtnGravar: TfcImageBtn;
    BtnCancelar: TfcImageBtn;
    BtnAlterar: TfcImageBtn;
    BtnDeletar: TfcImageBtn;
    BtnLocalizar: TfcImageBtn;
    BtnSair: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    Bevel1: TBevel;
    RxLabel1: TRxLabel;
    dbCod: TDBEdit;
    RxLabel2: TRxLabel;
    dbNome: TDBEdit;
    dbFoto: TDBImage;
    RxLabel45: TRxLabel;
    dbDataNasc: TDBDateEdit;
    dbIdade: TDBText;
    RxLabel44: TRxLabel;
    cmbCivil: TDBComboBox;
    RxLabel3: TRxLabel;
    cmbLkConv: TRxDBLookupCombo;
    btnConv: TfcImageBtn;
    RxLabel6: TRxLabel;
    Bevel2: TBevel;
    lbendereco: TRxLabel;
    lbnumero: TRxLabel;
    dbNum: TEvDBZeroEdit;
    lbcompl: TRxLabel;
    DbCompl: TDBEdit;
    lbBairro: TRxLabel;
    lbcep: TRxLabel;
    dbCep: TDBEdit;
    lbuf: TRxLabel;
    dbUf: TDBComboBox;
    lbcidade: TRxLabel;
    cmbLkCidade: TRxDBLookupCombo;
    btnCidade: TfcImageBtn;
    dbEmail: TDBEdit;
    BtnEmail: TfcImageBtn;
    lbemail: TRxLabel;
    Bevel3: TBevel;
    RxLabel7: TRxLabel;
    DbTel1: TDBEdit;
    RxLabel8: TRxLabel;
    dbObs: TDBMemo;
    RxLabel10: TRxLabel;
    DbFax: TDBEdit;
    RxLabel14: TRxLabel;
    DbCel: TDBEdit;
    RxLabel34: TRxLabel;
    dbRG: TDBEdit;
    dbCPF: TDBEdit;
    RxLabel35: TRxLabel;
    RxLabel13: TRxLabel;
    dbDataCad: TDBDateEdit;
    RxLabel9: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel5: TRxLabel;
    cmbSexo: TRxDBComboBox;
    RxLabel12: TRxLabel;
    dbCor: TRxDBComboBox;
    dbPront: TDBEdit;
    dbInd: TDBEdit;
    dbProf: TDBEdit;
    dbEnd: TDBEdit;
    dbBairro: TDBEdit;
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure btnIndClick(Sender: TObject);
    procedure btnLocProfClick(Sender: TObject);
    procedure btnConvClick(Sender: TObject);
    procedure btnEndClick(Sender: TObject);
    procedure btnBairroClick(Sender: TObject);
    procedure btnCidadeClick(Sender: TObject);
    procedure BtnEmailClick(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
    procedure cmbLkConvExit(Sender: TObject);
    procedure cmbLkEndExit(Sender: TObject);
    procedure dbNumExit(Sender: TObject);
    procedure cmbLkBairroExit(Sender: TObject);
    procedure dbUfExit(Sender: TObject);
    procedure cmbLkCidadeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure MemoObsExit(Sender: TObject);
    procedure btnProfClick(Sender: TObject);
  private
    { Private declarations }
    NomeCli : string;
    FResultado : longInt;
  public
    { Public declarations }
    Property Nome : string Read  NomeCli Write NomeCli;
    Property Resultado : longint Read Fresultado Write fresultado;
  end;

var
  FrmCadPaciente: TFrmCadPaciente;
  NovoItem:boolean;

implementation

uses UnitDmdados, UnitCadInd, UnitCadProf, UnitCadConv, UnitEnd,
     UnitCadBairro, UnitCadCidade, UnitPrincipal, unitLocPaciente;

{$R *.dfm}

procedure TFrmCadPaciente.fcShapeBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadPaciente.btnIndClick(Sender: TObject);
begin
  if (dmdados.tbPaciente.State=dsedit)or(dmdados.tbPaciente.State=dsInsert) then
    begin
    FrmCadInd:=TFrmCadInd.create(application);
    FrmCadInd.Showmodal;
    dmdados.TbPacienteCodIndic.Value:=frmCadInd.Indicacao;
    frmCadInd.Free;
    end;
end;

procedure TFrmCadPaciente.btnLocProfClick(Sender: TObject);
begin
  if (dmdados.tbPaciente.State=dsedit)or(dmdados.tbPaciente.State=dsInsert) then
    begin
    FrmCadProf:=TFrmCadProf.create(application);
    FrmCadProf.Showmodal;
    Dmdados.TbPacienteCodProf.Value:=FrmCadProf.Profissao;
    FrmCadProf.free;
    end;
end;

procedure TFrmCadPaciente.btnConvClick(Sender: TObject);
begin
  if (dmdados.tbPaciente.State=dsedit)or(dmdados.tbPaciente.State=dsInsert) then
    begin
    FrmCadConv:=TFrmCadConv.create(application);
    FrmCadConv.Showmodal;
    Dmdados.TbPacienteCodConv.Value:=FrmCadConv.Convenio;
    FrmCadConv.free;
    end;
end;

procedure TFrmCadPaciente.btnEndClick(Sender: TObject);
begin
  if (dmdados.tbPaciente.State=dsedit)or(dmdados.tbPaciente.State=dsInsert) then
    begin
    FrmCadEnd:=TFrmCadEnd.create(application);
    FrmCAdEnd.Showmodal;
    dmdados.TbPacienteCodEnd.Value:=frmCadEnd.endereco;
    frmCadEnd.Free;
    end;
end;

procedure TFrmCadPaciente.btnBairroClick(Sender: TObject);
begin
if (dmdados.tbPaciente.State=dsedit)or(dmdados.tbPaciente.State=dsInsert) then
  begin
  FrmCadBairro:=TFrmCadBairro.create(application);
  FrmCadBairro.Showmodal;
  Dmdados.TbPacienteCodBair.Value:=FrmCadBairro.Bairro;
  FrmCadBairro.free;
  end;
end;

procedure TFrmCadPaciente.btnCidadeClick(Sender: TObject);
begin
  if (dmdados.tbPaciente.State=dsedit)or(dmdados.tbPaciente.State=dsInsert) then
    begin
    FrmCadCidade:=TFrmCadCidade.create(application);
    FrmCadCidade.Showmodal;
    Dmdados.TbPacienteCodcid.Value:=FrmCadCidade.cidade;
    FrmCadCidade.free;
    end;
end;

procedure TFrmCadPaciente.BtnEmailClick(Sender: TObject);
var
 url : string;
begin
url :='mailto:'+dmdados.TbPacienteEmail.Value;
shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmCadPaciente.dbNomeExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If DBnome.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Nome do Paciente');
      DBnome.SetFocus;
      End;
    End;
end;

procedure TFrmCadPaciente.cmbLkConvExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If cmbLkConv.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Conv�nio');
      cmbLkConv.SetFocus;
      End;
    End;

end;

procedure TFrmCadPaciente.cmbLkEndExit(Sender: TObject);
begin
 If NovoItem Then
    Begin
    If dbEnd.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Endere�o');
      dbEnd.SetFocus;
      End;
    End;
end;

procedure TFrmCadPaciente.dbNumExit(Sender: TObject);
begin
 If NovoItem Then
    Begin
    If dbNum.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO');
      dbNum.SetFocus;
      End;
    End;
end;

procedure TFrmCadPaciente.cmbLkBairroExit(Sender: TObject);
begin
 If NovoItem Then
    Begin
    If dbBairro.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o BAIRRO');
      dbBairro.SetFocus;
      End;
    End;
end;

procedure TFrmCadPaciente.dbUfExit(Sender: TObject);
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

procedure TFrmCadPaciente.cmbLkCidadeExit(Sender: TObject);
begin
 If NovoItem Then
    Begin
    If cmbLkcidade.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a CIDADE');
      cmbLkCidade.SetFocus;
      End;
    End;
end;

procedure TFrmCadPaciente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TFrmCadPaciente.BtnPrimeiroClick(Sender: TObject);
begin
dmdados.TbPaciente.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TFrmCadPaciente.BtnAnteriorClick(Sender: TObject);
begin
dmdados.tbPaciente.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
If dmdados.TbPaciente.bof Then
 Begin
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
  End;
end;

procedure TFrmCadPaciente.BtnProximoClick(Sender: TObject);
begin
dmdados.tbPaciente.next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
If dmdados.tbPaciente.Eof Then
 Begin
 btnProximo.Enabled:=False;
 btnUltimo.Enabled:=False;
 end;
end;

procedure TFrmCadPaciente.BtnUltimoClick(Sender: TObject);
begin
dmdados.tbPaciente.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TFrmCadPaciente.BtnNovoClick(Sender: TObject);
begin
dmdados.TbPaciente.Append;
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
{habilitando os componentes}
dbNome.Enabled:=true;
cmbSexo.Enabled:= True;
dbCor.Enabled:= True;
dbDataNasc.Enabled:=True;
cmbCivil.Enabled:=true;
dbInd.Enabled:=true;
dbRg.Enabled:=True;
dbCpf.Enabled:=True;
cmbLkConv.Enabled:=true;
dbTel1.Enabled:=True;
dbFax.Enabled:=true;
dbCel.Enabled:=true;
dbEmail.Enabled:=True;
dbEnd.Enabled:=True;
dbNum.Enabled:= True;
dbCompl.Enabled:=True;
dbBairro.Enabled:=True;
dbCep.Enabled:=True;
dbUf.Enabled:=True;
cmbLkCidade.Enabled:=True;
dbProf.Enabled:=True;
dbNome.SetFocus;
end;

procedure TFrmCadPaciente.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
  Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbPaciente.DatabaseName;
  Tabela.TableName := dmDados.tbPaciente.TableName;
  Tabela.Open;
  //Campo que n�o pode repetir
 { If dbCpf.Text='           ' Then
    Begin
      Campos:=Campos+' CPF ';
      Gravar:=False;
      Vazio:=True;
    End
  Else
    Begin
    VerCPF1.NumeroCPF:= dbcpf.text;
    If not VerCpf1.valid Then
      Begin
      Showmessage('CPF inv�lido!');
      Gravar:=False;
      End
    Else
      Begin
      If Tabela.Locate('CPF',dbCPF.Text,[]) Then
        If not((DmDados.tbPaciente.State=dsEdit) And (dmDados.tbPaciente.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          End
      End;
    End; }
  //Campo que n�o pode estar vazio
  If dbNome.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Nome do Paciente';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBnum.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'N�mero';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBcep.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'CEP';
    Gravar:=False;
    Vazio:=True;
    end;
  //Campos com uso de Combo
  If dbUF.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Estado';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to dbUF.Items.Count-1 Do
      If dbUF.Text=dbUF.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do Estado inv�lido!');
      Gravar:=False;
      End;
    End;
  //Campo que tem conte�do de outra Tabela
  If cmbLkConv.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Conv�nio';
    Gravar:=False;
    Vazio:=True;
    end
  Else
    If Not(dmDados.TbConvenio.Locate('Desc',cmbLkConv.Text,[])) Then
      Begin
      Showmessage('CONV�NIO n�o Cadastrado!!');
      Gravar:=False;
      End;
  If dbEnd.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Endere�o';
    Gravar:=False;
    Vazio:=True;
    end
  Else
    If Not(dmDados.TbEndereco.Locate('End',dbEnd.Text,[])) Then
      Begin
      Showmessage('ENDERE�O n�o Cadastrado!!');
      Gravar:=False;
      End;

  If dbBairro.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Bairro';
    Gravar:=False;
    Vazio:=True;
    end
  Else
    If Not(dmDados.TbBairro.Locate('Bairro',dbBairro.Text,[])) Then
      Begin
      Showmessage('BAIRRO n�o Cadastrado!!');
      Gravar:=False;
      End;
    If cmbLkCidade.Text= '' then
      Begin
      If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'Cidade';
      Gravar:=False;
      Vazio:=True;
      end
    Else
      If Not(dmDados.TbCidade.Locate('Cidade',cmbLkCidade.Text,[])) Then
        Begin
        Showmessage('CIDADE n�o Cadastrada!!');
        Gravar:=False;
        cmbLkCidade.SetFocus;
        End;
      If Gravar Then
        Begin
          DMDados.TbPaciente.Post;
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
          BtnLocalizar.Enabled:=True;
          {desabilitando os componentes}
          dbNome.Enabled:=False;
          cmbSexo.Enabled:= False;
          dbCor.Enabled:= false;
          dbDataNasc.Enabled:=False;
          cmbCivil.Enabled:=False;
          dbInd.Enabled:=False;
          dbRg.Enabled:=False;
          dbCpf.Enabled:=False;
          cmbLkConv.Enabled:=False;
          dbTel1.Enabled:=False;
          dbFax.Enabled:=False;
          dbCel.Enabled:=False;
          dbEmail.Enabled:=False;
          dbEnd.Enabled:=False;
          dbNum.Enabled:= False;
          dbCompl.Enabled:=False;
          dbBairro.Enabled:=False;
          dbCep.Enabled:=False;
          dbUf.Enabled:=False;
          cmbLkCidade.Enabled:=False;
          dbProf.Enabled:=False;
          ShowMessage ('Dados gravados com sucesso!');
        End
      Else
        Begin
          If Vazio Then
           ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
          end;
Tabela.Free;

end;

procedure TFrmCadPaciente.BtnCancelarClick(Sender: TObject);
begin
NovoItem:=False;
dmdados.vTabStt:= True;
DMDados.tbPaciente.Cancel;
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
{desabilitando os objetos}
dbNome.Enabled:=False;
cmbSexo.Enabled:= False;
dbCor.Enabled:= false;
dbDataNasc.Enabled:=False;
cmbCivil.Enabled:=False;
dbInd.Enabled:=False;
dbRg.Enabled:=False;
dbCpf.Enabled:=False;
cmbLkConv.Enabled:=False;
dbTel1.Enabled:=False;
dbFax.Enabled:=False;
dbCel.Enabled:=False;
dbEmail.Enabled:=False;
dbEnd.Enabled:=False;
dbNum.Enabled:= False;
dbCompl.Enabled:=False;
dbBairro.Enabled:=False;
dbCep.Enabled:=False;
dbUf.Enabled:=False;
cmbLkCidade.Enabled:=False;
dbProf.Enabled:=False;
end;

procedure TFrmCadPaciente.BtnAlterarClick(Sender: TObject);
begin
if dmdados.TbPaciente.RecordCount=0 then
   ShowMessage('Tabela vazia')
   else
begin
NovoItem:=True;
dmdados.vTabStt:=False;
DMDados.tbPaciente.Edit;
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
{Habilitando os componentes}
dbNome.Enabled:=true;
cmbSexo.Enabled:= True;
dbCor.Enabled:= True;
dbDataNasc.Enabled:=True;
cmbCivil.Enabled:=true;
dbInd.Enabled:=true;
dbRg.Enabled:=True;
dbCpf.Enabled:=True;
cmbLkConv.Enabled:=true;
dbTel1.Enabled:=True;
dbFax.Enabled:=true;
dbCel.Enabled:=true;
dbEmail.Enabled:=True;
dbEnd.Enabled:=True;
dbNum.Enabled:= True;
dbCompl.Enabled:=True;
dbBairro.Enabled:=True;
dbCep.Enabled:=True;
dbUf.Enabled:=True;
cmbLkCidade.Enabled:=True;
dbProf.Enabled:=True;
dbNome.SetFocus;
end;
end;

procedure TFrmCadPaciente.BtnDeletarClick(Sender: TObject);
begin
if dmdados.tbPaciente.RecordCount=0 then
   ShowMessage('Tabela vazia')
   else
   begin
   If Application.MessageBox('Tem certeza que deseja excluir este Paciente ?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      begin
      dmdados.tbPaciente.Delete;
      dmdados.tbpaciente.Refresh;
      end
   else
      DMDados.tbPaciente.cancel;
   end;
end;

procedure TFrmCadPaciente.BtnLocalizarClick(Sender: TObject);
begin
FrmLocPaciente:=TFrmLocPaciente.create(application);
FrmLocPaciente.Showmodal;
end;

procedure TFrmCadPaciente.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadPaciente.MemoObsExit(Sender: TObject);
begin
Panel3.SetFocus;
end;

procedure TFrmCadPaciente.btnProfClick(Sender: TObject);
begin
  FrmCadProf:=TFrmCadProf.create(application);
  FrmCadProf.Showmodal;
end;

end.
