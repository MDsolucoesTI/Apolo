//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMenu, Menus, ComCtrls, ToolWin, ExtCtrls,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  LMDMessageHint, LMDHint, LMDBaseLabel, LMDCustomLabel,
  LMDCustomLabelFill, LMDLabelFill, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDGraphicControl, LMDCustomGraphicLabel,
  LMDGraphicLabel, LMDScrollText, SRLabel, EHintBal, RXCtrls, EFocCol,
  ImgList,ShellApi, EPaswd, EAppProt, DB, DBTables, jpeg, fcImager,
  WinSkinData;

type
  TFrmPrincipal = class(TForm)
    ControlBar1: TControlBar;
    StandardToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    MainMenu: TMainMenu;
    Arquivo1: TMenuItem;
    CadastrodePessoas1: TMenuItem;
    Convnio1: TMenuItem;
    N1: TMenuItem;
    EditordeTexto1: TMenuItem;
    N6: TMenuItem;
    Sair1: TMenuItem;
    Configuraes1: TMenuItem;
    Gerais1: TMenuItem;
    Ajuda1: TMenuItem;
    Ajuda2: TMenuItem;
    EnviesuaDvidapeloEmail1: TMenuItem;
    SobreoTritonLigth1: TMenuItem;
    Procedimentos1: TMenuItem;
    Agenda1: TMenuItem;
    AGendar1: TMenuItem;
    Pronturio1: TMenuItem;
    ToolButton9: TToolButton;
    XPMenu1: TXPMenu;
    EvFocusColor1: TEvFocusColor;
    ImgBarra: TImageList;
    ImgMenu: TImageList;
    RegistrodeProcedimentos1: TMenuItem;
    EvAppProtect1: TEvAppProtect;
    EvHintBalloon1: TEvHintBalloon;
    Senhas1: TMenuItem;
    EvPassword1: TEvPassword;
    Table1: TTable;
    Table1Usuario: TStringField;
    Table1Senha: TStringField;
    Mdicos1: TMenuItem;
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    AgendaTelefnica1: TMenuItem;
    Mdulos1: TMenuItem;
    Estoque2: TMenuItem;
    ToolButton5: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ResumodaAgenda1: TMenuItem;
    ListadeEspera1: TMenuItem;
    Estatstica1: TMenuItem;
    SaladeEspera1: TMenuItem;
    enviarmensagem1: TMenuItem;
    Laudos1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    AgendadoMdico1: TMenuItem;
    fcImager1: TfcImager;
    SkinData1: TSkinData;
    procedure StatusTeclas(vAcao:boolean;vTeclas:string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CadastrodePessoas1Click(Sender: TObject);
    procedure Convnio1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Procedimentos1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton1Click(Sender: TObject);
    procedure SobreoTritonLigth1Click(Sender: TObject);
    procedure EnviesuaDvidapeloEmail1Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure Gerais1Click(Sender: TObject);
    procedure RegistrodeProcedimentos1Click(Sender: TObject);
    procedure EditordeTexto1Click(Sender: TObject);
    procedure EvPassword1Error(Sender: TObject; Error: TEvPasswordError);
    procedure EvPassword1Validate(Sender: TObject; UserName,
      Password: String; var Valid: Boolean);
    procedure Senhas1Click(Sender: TObject);
    procedure EvPassword1BeforeInput(Sender: TObject);
    procedure EvPassword1AfterInput(Sender: TObject);
    procedure Mdicos1Click(Sender: TObject);
    procedure AgendaTelefnica1Click(Sender: TObject);
    procedure Estatsticas1Click(Sender: TObject);
    procedure ResumodaAgenda1Click(Sender: TObject);
    procedure ListadeEspera1Click(Sender: TObject);
    procedure SaladeEspera2Click(Sender: TObject);
    procedure Estatstica1Click(Sender: TObject);
    procedure enviarmensagem1Click(Sender: TObject);
    procedure Pronturio1Click(Sender: TObject);
    procedure AGendar1Click(Sender: TObject);
    procedure AgendadoMdico1Click(Sender: TObject);
    procedure SaladeEspera1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  ListaTeclas : String;
  PilhaTeclas : array[1..10] of string;
  Topo : integer;
  Acao:boolean;

implementation

uses UnitCadConv, UnitProced, UnitDmdados, UnitSobre, UnitParametros,
     UnitRegProced, REMain, unitCadFisico, UnitCadSenha, UnitAgendaTel,
     UnitEstatistica, UnitResumoAgenda, UnitListaEsp, UnitEnvioMens,
     UnitAgenda, UnitSalaEsp, UnitCadMedico, UnitCadPaciente,
  UnitProntuario, UnitAgendaMedica;

{$R *.dfm}

procedure TfrmPrincipal.StatusTeclas(vAcao:boolean;vTeclas:string);
begin
  if vAcao then
    begin
    Topo:=Topo + 1;
    if Topo > 0 Then
      PilhaTeclas[Topo]:=StatusBar1.Panels[0].Text;
    StatusBar1.Panels[0].Text:=vTeclas;
    end
  else
    begin
    StatusBar1.Panels[0].Text:=PilhaTeclas[Topo];
    Topo:=Topo-1;
    end;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Application.HintShortPause:= 500;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Topo:= -1;
  ListaTeclas:='[F2] Pacientes [F3] Prontu�rio [F4] Agenda  [F5] Par�metros [F6] Ajuda [ESC] Sai';
  StatusTeclas(True,ListaTeclas);
 { if table1.RecordCount=0 then  //obriga o cadastro de senha no 1� uso
      begin
        frmCadSenha:=tfrmCadSenha.create(application);
        frmCadSenha.showModal;
      end;
  evPassword1.Execute; }
end;

procedure TFrmPrincipal.CadastrodePessoas1Click(Sender: TObject);
begin
  FrmCadPaciente:=TFrmCadPaciente.create(application);
  FrmCadPaciente.Showmodal;
end;

procedure TFrmPrincipal.Convnio1Click(Sender: TObject);
begin
  FrmCadConv:=TFrmCadConv.create(application);
  FrmCadConv.Showmodal;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.Procedimentos1Click(Sender: TObject);
begin
  FrmProced:=TFrmproced.create(application);
  FrmProced.Showmodal;
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de navega��o
      VK_F2   : ToolButton1.Click;
      VK_F3   : ToolButton3.Click;
      VK_F4   : ToolButton4.Click;
      VK_F5   : ToolButton9.Click;
      VK_F6   : ToolButton6.Click;
      VK_ESCAPE : close;
    end;
end;

procedure TFrmPrincipal.ToolButton1Click(Sender: TObject);
begin
  FrmCadPaciente:=TFrmCadPaciente.create(application);
  FrmCadPaciente.Showmodal;
end;

procedure TFrmPrincipal.SobreoTritonLigth1Click(Sender: TObject);
begin
  FrmSobre:=TFrmSobre.create(application);
  FrmSobre.ShowModal;
end;

procedure TFrmPrincipal.EnviesuaDvidapeloEmail1Click(Sender: TObject);
var
 url : string;
begin
url :='mailto:mary_Schiavoni@bol.com.br';
shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmPrincipal.ToolButton9Click(Sender: TObject);
begin
  FrmParametros:=TFrmParametros.create(application);
  FrmParametros.ShowModal;
end;

procedure TFrmPrincipal.Gerais1Click(Sender: TObject);
begin
  FrmParametros:=TFrmParametros.create(application);
  FrmParametros.ShowModal;
end;

procedure TFrmPrincipal.RegistrodeProcedimentos1Click(Sender: TObject);
begin
  FrmRegProced:=TFrmRegProced.Create(Application);
  FrmRegProced.ShowModal;
end;

procedure TFrmPrincipal.EditordeTexto1Click(Sender: TObject);
begin
  FrmEditorRTF:=TFrmEditorRTF.Create(application);
  FrmEditorRTF.ShowModal;
end;

procedure TFrmPrincipal.EvPassword1Error(Sender: TObject;
  Error: TEvPasswordError);
begin
      ShowMessage('O usu�rio atual n�o pode ser confirmado. ' +
        'A aplica��o ser� terminada.');
      Application.Terminate;
end;

procedure TFrmPrincipal.EvPassword1Validate(Sender: TObject; UserName,
  Password: String; var Valid: Boolean);
begin
     if Table1.FindKey([username]) then
        Valid := Table1senha.AsString = Password
    else
       ShowMessage('O nome de usu�rio e senha informado n�o s�o v�lidos.');
end;

procedure TFrmPrincipal.Senhas1Click(Sender: TObject);
begin
  FrmCadSenha:=TFrmCadSenha.create(application);
  FrmCadSenha.ShowModal;
end;

procedure TFrmPrincipal.EvPassword1BeforeInput(Sender: TObject);
begin
  Table1.Open;
end;

procedure TFrmPrincipal.EvPassword1AfterInput(Sender: TObject);
begin
 Table1.Close;
end;

procedure TFrmPrincipal.Mdicos1Click(Sender: TObject);
begin
  FrmCadMedico:=TFrmCadMedico.create(application);
  FrmCadMedico.Showmodal;
end;

procedure TFrmPrincipal.AgendaTelefnica1Click(Sender: TObject);
begin
  FrmAgendaTel:=TFrmAgendaTel.create(application);
  FrmAgendaTel.Showmodal;
end;

procedure TFrmPrincipal.Estatsticas1Click(Sender: TObject);
begin
  FrmEstatistica:=TFrmEstatistica.create(application);
  FrmEstatistica.Showmodal;
end;

procedure TFrmPrincipal.ResumodaAgenda1Click(Sender: TObject);
begin
  FrmResumoAgenda:=TFrmResumoAgenda.create(application);
  FrmResumoAgenda.Showmodal;
end;

procedure TFrmPrincipal.ListadeEspera1Click(Sender: TObject);
begin
  FrmListaEsp:=TFrmListaEsp.create(application);
  FrmListaEsp.Showmodal;
end;

procedure TFrmPrincipal.SaladeEspera2Click(Sender: TObject);
begin
  FrmSalaEsp:=TFrmSalaEsp.create(application);
  FrmSalaEsp.Showmodal;
end;

procedure TFrmPrincipal.Estatstica1Click(Sender: TObject);
begin
  FrmEstatistica:=TFrmEstatistica.create(application);
  FrmEstatistica.Showmodal;
end;

procedure TFrmPrincipal.enviarmensagem1Click(Sender: TObject);
begin
  FrmEnvioMens:=TFrmEnvioMens.create(application);
  FrmEnvioMens.Showmodal;
end;

procedure TFrmPrincipal.Pronturio1Click(Sender: TObject);
begin
  FrmProntuario:=TFrmProntuario.create(application);
  FrmProntuario.Showmodal;
end;

procedure TFrmPrincipal.AGendar1Click(Sender: TObject);
begin
  FrmAgenda:=TFrmAgenda.create(application);
  FrmAgenda.Showmodal;
end;

procedure TFrmPrincipal.AgendadoMdico1Click(Sender: TObject);
begin
  FrmAgendaMedica:=TFrmAgendaMedica.create(application);
  FrmAgendaMedica.Showmodal;
end;

procedure TFrmPrincipal.SaladeEspera1Click(Sender: TObject);
begin
  FrmSalaEsp:=TFrmSalaEsp.create(application);
  FrmSalaEsp.Showmodal;
end;

end.
