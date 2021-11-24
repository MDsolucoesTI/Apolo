//////////////////////////////////////////////////////////////////////////
// Criacao...........: 08/2002
// Sistema...........: Apolo - Automacao Clinica Medica
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitDmdados;

interface

uses
  SysUtils, Classes, DB, DBTables,dbiProcs;

type
  TDMdados = class(TDataModule)
    DsAtestado: TDataSource;
    TbAtestado: TTable;
    TbCidade: TTable;
    DsCidade: TDataSource;
    DsConvenio: TDataSource;
    TbConvenio: TTable;
    TbConvenioDesc: TStringField;
    TbConvenioPrazo: TSmallintField;
    TbConvenioEnd: TStringField;
    TbConvenioNum: TSmallintField;
    TbConvenioCompl: TStringField;
    TbConvenioBairro: TStringField;
    TbConvenioCep: TStringField;
    TbConvenioUf: TStringField;
    TbConvenioContato: TStringField;
    TbConvenioTel1: TStringField;
    TbConvenioTel2: TStringField;
    TbConvenioFax: TStringField;
    TbDieta: TTable;
    DsDieta: TDataSource;
    TbDietaDieta: TMemoField;
    DsEndereco: TDataSource;
    TbEndereco: TTable;
    TbExame: TTable;
    DsExame: TDataSource;
    TbExameExame: TMemoField;
    DsHistorico: TDataSource;
    TbHistorico: TTable;
    TbHistoricoHistorico: TMemoField;
    TbHorario: TTable;
    DsHorario: TDataSource;
    TbHorarioNada: TAutoIncField;
    TbHorarioData: TDateField;
    TbHorarioHora: TTimeField;
    TbHorarioTel1: TStringField;
    TbHorarioTel2: TStringField;
    TbHorarioCel: TStringField;
    DsIndicacao: TDataSource;
    TbIndicacao: TTable;
    TbIndicacaoIndicacao: TStringField;
    TbLaudo: TTable;
    DsLaudo: TDataSource;
    TbLaudoAc: TStringField;
    TbLaudoTitulo: TStringField;
    TbLaudoLaudo: TMemoField;
    DsPaciente: TDataSource;
    TbPaciente: TTable;
    TbPacienteNome: TStringField;
    TbPacienteSexo: TStringField;
    TbPacienteNasc: TDateField;
    TbPacienteRg: TStringField;
    TbPacienteCpf: TStringField;
    TbPacienteTel1: TStringField;
    TbPacienteTel2: TStringField;
    TbPacienteFax: TStringField;
    TbPacienteCel: TStringField;
    TbPacienteEmail: TStringField;
    TbPacienteDtCad: TDateField;
    TbPacienteNum: TSmallintField;
    TbPacienteCompl: TStringField;
    TbPacienteCep: TStringField;
    TbPacienteUf: TStringField;
    TbPacienteObs: TMemoField;
    DsProced: TDataSource;
    TbProced: TTable;
    TbProcedProced: TStringField;
    TbProfissao: TTable;
    DsProfissao: TDataSource;
    DsReceita: TDataSource;
    TbReceita: TTable;
    TbReceitaReceita: TMemoField;
    TbBairro: TTable;
    DsBairro: TDataSource;
    TbBairroBairro: TStringField;
    TbAtestadoCodAtes: TAutoIncField;
    TbAtestadoAtestado: TMemoField;
    TbCidadeCodCidade: TAutoIncField;
    TbCidadeCidade: TStringField;
    TbConvenioCodConv: TAutoIncField;
    TbConvenioCodEnd: TIntegerField;
    TbDietaCodDieta: TAutoIncField;
    TbEnderecoCodEnd: TAutoIncField;
    TbEnderecoEnd: TStringField;
    TbExameCodEx: TAutoIncField;
    TbHistoricoCodHist: TAutoIncField;
    TbIndicacaoCodIndic: TAutoIncField;
    TbLaudoCodLaudo: TAutoIncField;
    TbPacienteCodPac: TAutoIncField;
    TbProcedCodProced: TAutoIncField;
    TbProfissaoCodProf: TAutoIncField;
    TbReceitaCodReceita: TAutoIncField;
    TbBairroCodBairro: TAutoIncField;
    TbConvenioCodBairro: TIntegerField;
    TbConvenioObs: TMemoField;
    TbPacienteCodIndic: TIntegerField;
    TbPacienteCodConv: TIntegerField;
    TbPacienteCodEnd: TIntegerField;
    TbPacienteCodBair: TIntegerField;
    TbPacienteCodCid: TIntegerField;
    TbHorarioTipo: TStringField;
    TbHorarioCodConv: TIntegerField;
    TbHorarioCodPac: TIntegerField;
    TbHistoricoCodPac: TIntegerField;
    TbHistoricoData: TDateField;
    TbAtestadoCodpac: TIntegerField;
    TbAtestadoData: TDateField;
    TbDietaCodpac: TIntegerField;
    TbDietaData: TDateField;
    TbExameCodpac: TIntegerField;
    TbExameData: TDateField;
    TbLaudoCodpac: TIntegerField;
    TbLaudoData: TDateField;
    TbReceitaCodpac: TIntegerField;
    TbReceitaData: TDateField;
    TbAtestadoLkPaciente: TStringField;
    TbAtestadoDataInicial: TDateField;
    TbAtestadoDataFinal: TDateField;
    TbAtestadoHorario: TTimeField;
    TbAtestadoHoraFalta: TTimeField;
    TbAtestadoConsulta: TBooleanField;
    TbAtestadoAcFam: TBooleanField;
    TbAtestadoExames: TBooleanField;
    TbAtestadoEntRetExames: TBooleanField;
    TbAtestadoRetorno: TBooleanField;
    TbAtestadoRepouso: TBooleanField;
    TbAtestadoOutros: TBooleanField;
    TbAtestadoDescOutros: TStringField;
    TbAtestadoCid: TBooleanField;
    TbAtestadoNumCid: TStringField;
    dsParametro: TDataSource;
    DsAgenda: TDataSource;
    TbAgenda: TTable;
    TbAgendaCodigo: TAutoIncField;
    TbAgendaPaciente: TStringField;
    TbAgendaData: TDateField;
    TbAgendaHora: TTimeField;
    TbAgendaTipo: TStringField;
    TbAgendaTel1: TStringField;
    TbAgendaTel2: TStringField;
    TbAgendaCelular: TStringField;
    TbAgendaObs: TStringField;
    TbAgendaObserv: TMemoField;
    TbAgendaCodConv: TIntegerField;
    TbAgendaLkConvenio: TStringField;
    TbAgendaStatus: TStringField;
    TbAgendaCodProced: TIntegerField;
    TbAgendaLkProced: TStringField;
    dsAgeProced: TDataSource;
    tbAgeProced: TTable;
    tbAgeProcedCodigo: TAutoIncField;
    tbAgeProcedCodProced: TIntegerField;
    tbAgeProcedPaciente: TStringField;
    tbAgeProcedData: TDateField;
    tbAgeProcedHora: TTimeField;
    tbAgeProcedTipo: TStringField;
    tbAgeProcedTel1: TStringField;
    tbAgeProcedObserv: TMemoField;
    tbAgeProcedTel2: TStringField;
    tbAgeProcedCelular: TStringField;
    tbAgeProcedObs: TStringField;
    tbAgeProcedStatus: TStringField;
    dsSessao: TDataSource;
    tbSessao: TTable;
    tbSessaoCodigo: TAutoIncField;
    tbSessaoCodPac: TIntegerField;
    tbSessaoData: TDateField;
    tbSessaoHora: TTimeField;
    tbSessaoQtde: TFloatField;
    tbSessaoAtual: TFloatField;
    tbSessaoCodProced: TIntegerField;
    TbPacienteUltConsu: TDateField;
    TbPacienteConsMarca: TSmallintField;
    TbPacienteConsConf: TSmallintField;
    TbPacienteConsCanc: TSmallintField;
    TbPacienteConsFalta: TSmallintField;
    tbSessaolkProced: TStringField;
    tbAgeProcedlksecAtual: TIntegerField;
    TbHorarioPaciente: TStringField;
    tbHistVisu: TTable;
    dsHistVisu: TDataSource;
    tbHistVisuCodigo: TAutoIncField;
    tbHistVisuPaciente: TStringField;
    tbHistVisuCodProced: TIntegerField;
    tbHistVisuData: TDateField;
    tbHistVisuHora: TTimeField;
    tbHistVisuTipo: TStringField;
    tbHistVisuTel1: TStringField;
    tbHistVisuObserv: TMemoField;
    tbHistVisuTel2: TStringField;
    tbHistVisuCelular: TStringField;
    tbHistVisuCodConv: TIntegerField;
    tbHistVisuObs: TStringField;
    tbHistVisuStatus: TStringField;
    TbParametro: TTable;
    TbParametroCodPar: TAutoIncField;
    TbParametroEmpresa: TStringField;
    TbParametroCNPJ: TStringField;
    TbParametroProprietario: TStringField;
    TbParametroCPF: TStringField;
    TbParametroEndereco: TStringField;
    TbParametroNumero: TSmallintField;
    TbParametroComplemento: TStringField;
    TbParametroBairro: TStringField;
    TbParametroCEP: TStringField;
    TbParametroCidade: TStringField;
    TbParametroUF: TStringField;
    TbParametroTel1: TStringField;
    TbParametroTel2: TStringField;
    TbParametroCelular: TStringField;
    TbParametroICMS: TFloatField;
    TbParametroLogo: TGraphicField;
    TbParametroCredRenda: TFloatField;
    TbParametroComissao: TFloatField;
    TbParametroCPMF: TFloatField;
    TbParametroMultaDia: TSmallintField;
    TbParametroValorMulta: TCurrencyField;
    TbParametroPercMulta: TFloatField;
    TbParametroDescDia: TSmallintField;
    TbParametroValorDesc: TCurrencyField;
    TbParametroPercDesc: TFloatField;
    TbParametroJurosDia: TSmallintField;
    TbParametroValorJuros: TCurrencyField;
    TbParametroPercJuros: TFloatField;
    TbParametroDecoEntra: TStringField;
    TbParametroMensPromo: TStringField;
    TbParametroMensRodape: TStringField;
    TbParametroPis: TFloatField;
    TbParametroCofins: TFloatField;
    TbParametroCS: TFloatField;
    TbParametroInsEstado: TStringField;
    tbAgeProcedlkProced: TStringField;
    tbUltCons: TTable;
    dsUltCons: TDataSource;
    tbUltConsCodigo: TAutoIncField;
    tbUltConsPaciente: TStringField;
    tbUltConsCodProced: TIntegerField;
    tbUltConsData: TDateField;
    tbUltConsHora: TTimeField;
    tbUltConsTipo: TStringField;
    tbUltConsTel1: TStringField;
    tbUltConsObserv: TMemoField;
    tbUltConsTel2: TStringField;
    tbUltConsCelular: TStringField;
    tbUltConsCodConv: TIntegerField;
    tbUltConsObs: TStringField;
    tbUltConsStatus: TStringField;
    dsFisico: TDataSource;
    tbFisico: TTable;
    tbFisicoNada: TAutoIncField;
    tbFisicoCodPac: TIntegerField;
    tbFisicoData: TDateField;
    tbFisicoPeso: TFloatField;
    tbFisicoAltura: TFloatField;
    tbFisicoEstOssea: TStringField;
    tbFisicoLkPaciente: TStringField;
    tbSessaoLkPaciente: TStringField;
    TbPacienteEstCivil: TStringField;
    TbConveniolkEnd: TStringField;
    dsSenha: TDataSource;
    tbSenha: TTable;
    tbSenhaUsuario: TStringField;
    tbSenhaSenha: TStringField;
    TbPacienteCodProf: TIntegerField;
    TbProfissaoProf: TStringField;
    TbPacienteStatus: TStringField;
    TbPacienteFoto: TGraphicField;
    TbPacienteCor: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure TbHistoricoAfterDelete(DataSet: TDataSet);
    procedure TbHistoricoAfterPost(DataSet: TDataSet);
    procedure TbAtestadoAfterDelete(DataSet: TDataSet);
    procedure TbAtestadoAfterPost(DataSet: TDataSet);
    procedure TbCidadeAfterDelete(DataSet: TDataSet);
    procedure TbCidadeAfterPost(DataSet: TDataSet);
    procedure TbConvenioAfterDelete(DataSet: TDataSet);
    procedure TbConvenioAfterPost(DataSet: TDataSet);
    procedure TbCCorrenteAfterDelete(DataSet: TDataSet);
    procedure TbDietaAfterDelete(DataSet: TDataSet);
    procedure TbDietaAfterPost(DataSet: TDataSet);
    procedure TbParametroAfterDelete(DataSet: TDataSet);
    procedure TbParametroAfterPost(DataSet: TDataSet);
    procedure tbFisicoAfterDelete(DataSet: TDataSet);
    procedure tbFisicoAfterPost(DataSet: TDataSet);
    procedure TbEnderecoAfterDelete(DataSet: TDataSet);
    procedure TbEnderecoAfterPost(DataSet: TDataSet);
    procedure TbExameAfterDelete(DataSet: TDataSet);
    procedure TbExameAfterPost(DataSet: TDataSet);
    procedure TbHorarioAfterDelete(DataSet: TDataSet);
    procedure TbHorarioAfterPost(DataSet: TDataSet);
    procedure tbUltConsAfterDelete(DataSet: TDataSet);
    procedure tbUltConsAfterPost(DataSet: TDataSet);
    procedure TbIndicacaoAfterDelete(DataSet: TDataSet);
    procedure TbIndicacaoAfterPost(DataSet: TDataSet);
    procedure TbLaudoAfterDelete(DataSet: TDataSet);
    procedure TbLaudoAfterPost(DataSet: TDataSet);
    procedure TbPacienteAfterDelete(DataSet: TDataSet);
    procedure TbPacienteAfterPost(DataSet: TDataSet);
    procedure TbBairroAfterDelete(DataSet: TDataSet);
    procedure TbBairroAfterPost(DataSet: TDataSet);
    procedure TbProcedAfterDelete(DataSet: TDataSet);
    procedure TbProcedAfterPost(DataSet: TDataSet);
    procedure TbProfissaoAfterDelete(DataSet: TDataSet);
    procedure TbProfissaoAfterPost(DataSet: TDataSet);
    procedure TbReceitaAfterDelete(DataSet: TDataSet);
    procedure TbReceitaAfterPost(DataSet: TDataSet);
    procedure TbAgendaAfterDelete(DataSet: TDataSet);
    procedure TbAgendaAfterPost(DataSet: TDataSet);
    procedure tbAgeProcedAfterDelete(DataSet: TDataSet);
    procedure tbAgeProcedAfterPost(DataSet: TDataSet);
    procedure tbSessaoAfterDelete(DataSet: TDataSet);
    procedure tbSessaoAfterPost(DataSet: TDataSet);
    procedure tbSenhaAfterDelete(DataSet: TDataSet);
    procedure tbSenhaAfterPost(DataSet: TDataSet);
    procedure tbHistVisuAfterDelete(DataSet: TDataSet);
    procedure tbHistVisuAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    fHabilitaTeclado : Boolean;
    fvTabStt:Boolean;
  public
    { Public declarations }
    Property HabilitaTeclado : Boolean Read  fHabilitaTeclado Write fHabilitaTeclado;
    Property vTabStt : Boolean Read  fvTabStt Write fvTabStt;
  end;

var
  DMdados: TDMdados;

implementation

{$R *.dfm}

procedure TDMdados.DataModuleCreate(Sender: TObject);
begin
  HabilitaTeclado:=True;
  vTabStt:=True;
end;

procedure TDMdados.TbHistoricoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbHistorico.Handle);
end;

procedure TDMdados.TbHistoricoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbHistorico.Handle);
end;

procedure TDMdados.TbAtestadoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbAtestado.Handle);
end;

procedure TDMdados.TbAtestadoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbAtestado.Handle);
end;

procedure TDMdados.TbCidadeAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbCidade.Handle);
end;

procedure TDMdados.TbCidadeAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbCidade.Handle);
end;

procedure TDMdados.TbConvenioAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbConvenio.Handle);
end;

procedure TDMdados.TbConvenioAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbConvenio.Handle);
end;

procedure TDMdados.TbCCorrenteAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbConvenio.Handle);
end;

procedure TDMdados.TbDietaAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbDieta.Handle);
end;

procedure TDMdados.TbDietaAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbDieta.Handle);
end;

procedure TDMdados.TbParametroAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbParametro.Handle);
end;

procedure TDMdados.TbParametroAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbParametro.Handle);
end;

procedure TDMdados.tbFisicoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbFisico.Handle);
end;

procedure TDMdados.tbFisicoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbFisico.Handle);
end;

procedure TDMdados.TbEnderecoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbEndereco.Handle);
end;

procedure TDMdados.TbEnderecoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbEndereco.Handle);
end;

procedure TDMdados.TbExameAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbExame.Handle);
end;

procedure TDMdados.TbExameAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbExame.Handle);
end;

procedure TDMdados.TbHorarioAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbHorario.Handle);
end;

procedure TDMdados.TbHorarioAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbHorario.Handle);
end;

procedure TDMdados.tbUltConsAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbUltCons.Handle);
end;

procedure TDMdados.tbUltConsAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbUltCons.Handle);
end;

procedure TDMdados.TbIndicacaoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbIndicacao.Handle);
end;

procedure TDMdados.TbIndicacaoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbIndicacao.Handle);
end;

procedure TDMdados.TbLaudoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbLaudo.Handle);
end;

procedure TDMdados.TbLaudoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbLaudo.Handle);
end;

procedure TDMdados.TbPacienteAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbPaciente.Handle);
end;

procedure TDMdados.TbPacienteAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbPaciente.Handle);
end;

procedure TDMdados.TbBairroAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbBairro.Handle);
end;

procedure TDMdados.TbBairroAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbBairro.Handle);
end;

procedure TDMdados.TbProcedAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbProced.Handle);
end;

procedure TDMdados.TbProcedAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbProced.Handle);
end;

procedure TDMdados.TbProfissaoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbProfissao.Handle);
end;

procedure TDMdados.TbProfissaoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbProfissao.Handle);
end;

procedure TDMdados.TbReceitaAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbReceita.Handle);
end;

procedure TDMdados.TbReceitaAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbReceita.Handle);
end;

procedure TDMdados.TbAgendaAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbAgenda.Handle);
end;

procedure TDMdados.TbAgendaAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbAgenda.Handle);
end;

procedure TDMdados.tbAgeProcedAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbAgeProced.Handle);
end;

procedure TDMdados.tbAgeProcedAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbAgeProced.Handle);
end;

procedure TDMdados.tbSessaoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbSessao.Handle);
end;

procedure TDMdados.tbSessaoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbSessao.Handle);
end;

procedure TDMdados.tbSenhaAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbProced.Handle);
end;

procedure TDMdados.tbSenhaAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbProfissao.Handle);
end;

procedure TDMdados.tbHistVisuAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbAgeProced.Handle);
end;

procedure TDMdados.tbHistVisuAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbAgeProced.Handle);
end;

end.
