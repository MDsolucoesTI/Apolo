//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, fcImgBtn, ExtCtrls, fcClearPanel, fcButtonGroup,
  fcButton, fcShapeBtn, fcLabel, fcImage, fcimageform, StdCtrls, DBCtrls,
  EDBZero, Mask, RXCtrls, jpeg, VerCNPJ, VerCPF, ExtDlgs;

type
  TFrmParametros = class(TForm)
    fcImageForm1: TfcImageForm;
    Shape1: TShape;
    fcLabel1: TfcLabel;
    fcShapeBtn1: TfcShapeBtn;
    fcButtonGroup1: TfcButtonGroup;
    fcButtonGroup1fcImageBtn1: TfcImageBtn;
    fcButtonGroup1fcImageBtn2: TfcImageBtn;
    fcButtonGroup1fcImageBtn3: TfcImageBtn;
    PageControl1: TPageControl;
    tabEmpresa: TTabSheet;
    tabDiversos: TTabSheet;
    tabValores: TTabSheet;
    Panel4: TPanel;
    Image3: TImage;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    lbempresa: TRxLabel;
    dbEmpresa: TDBEdit;
    lbie: TRxLabel;
    dbIE: TDBEdit;
    lbprop: TRxLabel;
    dbProp: TDBEdit;
    dbCPF: TDBEdit;
    lbcpf: TRxLabel;
    dbCGC: TDBEdit;
    lbcgc: TRxLabel;
    lbendereco: TRxLabel;
    DBend: TDBEdit;
    lbnumero: TRxLabel;
    dbNum: TEvDBZeroEdit;
    lbcomplemento: TRxLabel;
    DBcompl: TDBEdit;
    lbBairro: TRxLabel;
    DBbairro: TDBEdit;
    lbcidade: TRxLabel;
    DBcidade: TDBEdit;
    lbcep: TRxLabel;
    DBcep: TDBEdit;
    DBCBoxUF: TDBComboBox;
    lbuf: TRxLabel;
    lbtel1: TRxLabel;
    DBtel1: TDBEdit;
    lbtel2: TRxLabel;
    lbcelular: TRxLabel;
    DBTel2: TDBEdit;
    DBcel: TDBEdit;
    lbicms: TRxLabel;
    dbicms: TDBEdit;
    RxLabel3: TRxLabel;
    dbPis: TDBEdit;
    RxLabel5: TRxLabel;
    dbCS: TDBEdit;
    RxLabel4: TRxLabel;
    dbCofins: TDBEdit;
    lbMensPromo: TRxLabel;
    dbMensPromo: TDBEdit;
    lbMensRodape: TRxLabel;
    dbMensRodape: TDBEdit;
    Image7: TImage;
    Label3: TLabel;
    Label4: TLabel;
    dblogo: TDBImage;
    GroupBox1: TGroupBox;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    RxLabel25: TRxLabel;
    dbjurosdias: TDBEdit;
    dbjurosvalor: TDBEdit;
    dbjurosperc: TDBEdit;
    GroupBox2: TGroupBox;
    RxLabel26: TRxLabel;
    RxLabel27: TRxLabel;
    RxLabel28: TRxLabel;
    dbmultadias: TDBEdit;
    dbmultavalor: TDBEdit;
    dbmultaperc: TDBEdit;
    GroupBox3: TGroupBox;
    RxLabel29: TRxLabel;
    RxLabel30: TRxLabel;
    RxLabel31: TRxLabel;
    dbdescdias: TDBEdit;
    dbdescvalor: TDBEdit;
    dbdescperc: TDBEdit;
    GroupBox5: TGroupBox;
    RxLabel32: TRxLabel;
    RxLabel20: TRxLabel;
    dbcredito: TDBEdit;
    dbcomissao: TDBEdit;
    GroupBox4: TGroupBox;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    rbEntrada: TRadioButton;
    rbSaida: TRadioButton;
    AbreFigura: TOpenPictureDialog;
    VerCPF1: TVerCPF;
    VerCNPJ1: TVerCNPJ;
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbCGCExit(Sender: TObject);
    procedure dbCPFExit(Sender: TObject);
    procedure dblogoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParametros: TFrmParametros;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TFrmParametros.fcShapeBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmParametros.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
BEGIN
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  If dbempresa.Text='' Then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:='Empresa';
    Gravar:=False;
    Vazio:=True;
    End;
  If dbCpf.Text='           ' Then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'CPF';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    VerCPF1.NumeroCPF:= dbcpf.text;
    If not VerCpf1.valid Then
      Begin
      Showmessage('CPF inv�lido');
      Gravar:=False;
      End;
    end;
  If dbCgc.Text='              ' Then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'CNPJ';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    begin
    VerCnpj1.NumCnpj:= dbcgc.text;
    If not VerCnpj1.valid Then
      Begin
      Showmessage('CNPJ inv�lido');
      Gravar:=False;
      end;
    end;
  If Gravar Then
    Begin
    dmdados.TbParametro.Post;
    ShowMessage('Dados gravados com sucesso');
    Close;
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbempresa.SetFocus;
    end;
end;

procedure TFrmParametros.btnCancelarClick(Sender: TObject);
begin
  dmdados.TbParametro.cancel;
  Close;
end;

procedure TFrmParametros.dbCGCExit(Sender: TObject);
begin
  VerCnpj1.NumCnpj:= dbcgc.text;
  If not VerCnpj1.valid Then
    Begin
    Showmessage('CGC inv�lido');
    dbcgc.Clear;
    dbcgc.setfocus;
    End;
end;

procedure TFrmParametros.dbCPFExit(Sender: TObject);
begin
  VerCpf1.NumeroCpf:= dbcpf.text;
  If not VerCpf1.valid Then
    Begin
    Showmessage('CPF inv�lido');
    dbcpf.Clear;
    dbcpf.setfocus;
    End;
end;

procedure TFrmParametros.dblogoDblClick(Sender: TObject);
begin
 with AbreFigura do
    if Execute then DMdados.tbparametroLogo.LoadFromFile(AbreFigura.FileName);
end;

end.
