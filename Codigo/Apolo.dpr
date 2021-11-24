//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

program Apolo;

uses
  Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitCadInd in 'UnitCadInd.pas' {FrmCadInd},
  UnitCadProf in 'UnitCadProf.pas' {FrmCadProf},
  UnitEnd in 'UnitEnd.pas' {FrmCadEnd},
  UnitCadCidade in 'UnitCadCidade.pas' {FrmCadCidade},
  UnitCadConv in 'UnitCadConv.pas' {FrmCadConv},
  UnitCadBairro in 'UnitCadBairro.pas' {FrmCadBairro},
  UnitProced in 'UnitProced.pas' {FrmProced},
  UnitMarcarCons in 'UnitMarcarCons.pas' {FrmMarcarCons},
  UnitLocConv in 'UnitLocConv.pas' {FrmLocConv},
  UnitDmdados in 'UnitDmdados.pas' {DMdados: TDataModule},
  unitQrAtestado in 'unitQrAtestado.pas' {QrAtestado},
  UnitMarcProced in 'UnitMarcProced.pas' {FrmMarcProced},
  UnitDesmCons in 'UnitDesmCons.pas' {FrmDesmCons},
  UnitDesmProced in 'UnitDesmProced.pas' {FrmDesmProced},
  UnitEncaixe in 'UnitEncaixe.pas' {FrmEncaixe},
  UnitListaEsp in 'UnitListaEsp.pas' {FrmListaEsp},
  UnitConfCons in 'UnitConfCons.pas' {FrmConfCons},
  unitLocPaciente in 'unitLocPaciente.pas' {FrmLocPaciente},
  unitConfProced in 'unitConfProced.pas' {frmConfProced},
  UnitRegProced in 'UnitRegProced.pas' {FrmRegProced},
  unitQrBasico in 'unitQrBasico.pas' {qrBasico},
  UnitSobre in 'UnitSobre.pas' {FrmSobre},
  unitParametro in 'unitParametro.pas' {FrmParametro},
  UnitCadSenha in 'UnitCadSenha.pas' {frmCadSenha},
  UnitAgendaTel in 'UnitAgendaTel.pas' {FrmAgendaTel},
  UnitCadTel in 'UnitCadTel.pas' {FrmCadTel},
  UnitAgenda in 'UnitAgenda.pas' {FrmAgenda},
  //Lmddete1 in 'C:\Arquivos de programas\Borland\Delphi6\Componentes\LMD50SE\demos\delphi\lmdtextedit\LMDDETE1.PAS' {frmEdit},
  //Lmddete0 in 'C:\Arquivos de programas\Borland\Delphi6\Componentes\LMD50SE\demos\delphi\lmdtextedit\LMDDETE0.PAS' {frmFrame},
  UnitEstatistica in 'UnitEstatistica.pas' {FrmEstatistica},
  UnitSalaEsp in 'UnitSalaEsp.pas' {FrmSalaEsp},
  UnitCadPaciente in 'UnitCadPaciente.pas' {FrmCadPaciente},
  UnitCadMedico in 'UnitCadMedico.pas' {FrmCadMedico},
  UnitAgendaMedica in 'UnitAgendaMedica.pas' {FrmAgendaMedica},
  UnitResumoAgenda in 'UnitResumoAgenda.pas' {FrmResumoAgenda},
  UnitEnvioMens in 'UnitEnvioMens.pas' {FrmEnvioMens},
  UnitProntuario in 'UnitProntuario.pas' {FrmProntuario},
  UnitAcesPront in 'UnitAcesPront.pas' {FrmAcesPront};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMdados, DMdados);
  Application.Run;
end.
