function TFormAssistenteConexao.RetornaNomeLegivelView( strNomeView: String): String;
const total_array : integer  = 219;
var           Aux : String;
                c : integer;

function funTroca(psTexto: string) : String;
var
  i : Integer;
begin
  for i := 1 to Length(psTexto) do
  begin
    if (UpCase(psTexto[i]) = ' ')  then
      psTexto[i+1] := UpCase(psTexto[i+1]);
  end;
  result := psTexto;
end;


function ProcuraPrefixo : String;
const
 {$region ' LEIA-ME ...'}

  /////////////////////////////////////////////////////////////////////
  ///                                                               ///
  ///   Caso necessite adicionar algum prefixo a ser trocado,       ///
  ///   Altere o valores dos array's a cada Prefixo adicionado e    ///
  ///   altere a CONST (Constante)primeiramente                     ///
  ///   na Linha 4928, depois os array's                            ///
  ///   arrayPrefixo e o arrayNomes                                 ///
  ///   Cada prefixo adicionado no array arrayPrefixo,              ///
  ///   deve ser obrigatóriamente adiconado no arrayNomes,          ///
  ///   E os mesmo estão ordenados no estilo                        ///
  ///   "Batalha Naval" continue com o padrão por favor rsrsrs      ///
  ///                                                               ///
  /////////////////////////////////////////////////////////////////////

  {$endregion}

 {$region ' Array que contém os Prefixo ...  ' }
   arrayPrefixo : array[0..219] of string = ('sai'              ,'transf'             ,'tpp'                   ,'prod'                       ,
                                            'licit'             ,'entra'              ,'ped'                   ,'proc'                       ,
                                            'oc'                ,'g'                  ,'embalag'               ,'num'                        ,
                                            'qtd'               ,'ender'              ,'almox'                 ,'doc'                        ,
                                            'emp'               ,'fil'                ,'tpf'                   ,'ae'                         ,
                                            'af'                ,'nom'                ,'nome'                  ,'vlr'                        ,
                                            'sbl'               ,'snd'                ,'nrd'                   ,'nno'                        ,
                                            'nro'               ,'bol'                ,'cod'                   ,'codigo'                     ,
                                            'dsc'               ,'str'                ,'nda'                   ,'prc'                        ,
                                            'sld'               ,'cno'                ,'total'                 ,'nnr'                        ,
                                            'dgt'               ,'hst'                ,'dat'                   ,'data'                       ,
                                            'doc'               ,'tot_vlr'            ,'tot_sld'               ,'tip'                        ,
                                            'qtd'               ,'seq'                ,'ordco'                 ,'ordcoitem'                  ,
                                            'ano'               ,'gg'                 ,'tipo'                  ,'cp'                         ,
                                            'mes'               ,'cont'               ,'operacao'              ,'descricao'                  ,
                                            'devolucao'         ,'julga'              ,'dotacao'               ,'tdoc'                       ,
                                            'invent'            ,'autoriza'           ,'contabiliza'           ,'credito'                    ,
                                            'debito'            ,'secre'              ,'d'                     ,'agc'                        ,
                                            'bcn'               ,'serv'               ,'obs'                   ,'ct'                         ,    
                                            'bairr'             ,'estad'              ,'logra'                 ,'tpl'                        ,
                                            'munic'             ,'habdoc'             ,'docfo'                 ,'fornlicit'                  ,
                                            'licititem'         ,'valtot'             ,'perc'                  ,'valuni'                     ,
                                            'fabri'             ,'epp'                ,'me'                    ,'cndt'                       ,
                                            'solic'             ,'fabri'              ,'aidf'                  ,'nf'                         ,
                                            'de'                ,'solic'              ,'solicitem'             ,'public'                     ,
                                            'vig'               ,'cadfu'              ,'gvende'                ,'prev'                       ,
                                            'tpfol'             ,'ident'              ,'categtrab'             ,'profi'                      ,
                                            'func'              ,'ocorr'              ,'arredond'              ,'vw_pr'                      ,
                                            'vw_fl'             ,'vw_tr'              ,'vw_cp'                 ,'vw_al'                      ,
                                            'vw_pt'             ,'vw_it'              ,'vw'                    ,'pr'                         ,
                                            'fl'                ,'tr'                 ,'cp'                    ,'al'                         ,
                                            'pt'                ,'it'                 ,'docum'                 ,'salfam'                     ,
                                            'salfam'            ,'sit'                ,'dt'                    ,'aquisi'                     ,
                                            'tp'                ,'ult'                ,'cm'                    ,'venc'                       ,
                                            'orc'               ,'l'                  ,'orabst'                ,'ordemref'                   ,
                                            'resp'              ,'fabric'             ,'veic'                  ,'comb'                       ,
                                            'apensado'          ,'ass'                ,'docproc'               ,'tra'                        ,
                                            'princ'             ,'Path'               ,'prov'                  ,'cd'                         ,
                                            'manut'             ,'Qtde'               ,'homoli'                ,'habilic'                    ,
                                            'el'                ,'licitacao'          ,'convenio'              ,'subfuncao'                  ,
                                            'Orgao'             ,'funcao'             ,'acao'                  ,'orcamentaria'               ,
                                            'endereco'          ,'agencia'            ,'orcamento'             ,'unitario'                   ,
                                            'indice'            ,'apropriacao'        ,'liquido'               ,'classificacao'              ,
                                            'orcado'            ,'homologacao'        ,'dc'                    ,'legislacao'                 ,
                                            'intraorcamentario' ,'ppa'                ,'ate'                   ,'tot'                        ,
                                            'aplic'             ,'referencia'         ,'diferenca'             ,'lrf'                        ,
                                            'nivel'             ,'orcada'             ,'veiculo'               ,'serie'                      ,
                                            'inclusao'          ,'movimentacao'       ,'divisao'               ,'situacao'                   ,
                                            'admissao'          ,'demissao'           ,'padrao'                ,'vlrincidinssnormal'         ,
                                            'inst'              ,'irrf'               ,'cpf'                   ,'cnpj'                       ,
                                            'decter'            ,'previsao'           ,'abonofer'              ,'desc'                       ,
                                            'medico'            ,'pis'                ,'apos'                  ,'aposent'                    ,
                                            'apos'              ,'horar'              ,'adm'                   ,'afast'                      ,
                                            'trab'              ,'ativ'               ,'tpmoeda'               ,'nomeacao'                   ,
                                            'codsec'            ,'nomsec'             ,'observacoes'           ,'inss'                       ) ;
 {$endregion}

 {$region ' Array que contém os Novos Nomes ... '  }

  arrayNomes: array[0..219] of string = ('Saída'               ,'Transferência'        ,'Tipo do Produto'       ,'Produto'                   ,
                                         'Licitação'            ,'Entrada'              ,'Pedido'                ,'Processo'                  ,
                                         'Ordem de compra'      ,''                     ,'Embalagem'             ,'Numero'                    ,
                                         'Quantidade'           ,'Endereço'             ,'Almoxarifado'          ,'Documento'                 ,
                                         'Empresa'              ,'Filial'               ,'Tipo funcionário'      ,'Autorização de Empenho'    ,
                                         'Autorização de Forne.','Nome'                 ,'Nome'                  ,'Valor'                     ,
                                         'Símbolo'              ,'Número do Documento'  ,'Número e Digito'       ,'Nome e número'             ,
                                         'Número'               ,''                     ,'Código'                ,'Código'                    ,
                                         'Descrição'            ,''                     ,'Nnúmero Digito e Ano'  ,'Percentual'                ,
                                         'Saldo'                ,'Código nome'          ,'Total'                 ,'Nome numero'               ,
                                         'Dígito'               ,'Histórico'            ,'Data'                  ,'Data'                      ,
                                         'Documento'            ,'Valor Total'          ,'Saldo Total'           ,'Tipo'                      ,
                                         'Quantidade'           ,'Sequencial'           ,'Ordem de Compra'       ,'Ordem de compra Item'      ,
                                         'Ano'                  ,''                     ,'Tipo'                  ,'Compras'                   ,
                                         'Mês'                  ,'Contrato'             ,'Operação'              ,'Descrição'                 ,
                                         'Devolução'            ,'Julgamento'           ,'Dotação'               ,'Tipo documento'            ,
                                         'Inventário'           ,'Autorização'          ,'Contabilizado'         ,'Crédito'                   ,
                                         'Débito'               ,'Secretaria'           ,''                      ,'Agência'                   ,
                                         'Conta bancária'       ,'Serviço'              ,'Observação'            ,''                          ,
                                         'Bairro'               ,'Estado'               ,'Logradouro'            , 'Tipo local'               ,
                                         'Município'            ,'Habilitação Documento','Documento Funcionário' ,'Fornecedor Licitação'      ,
                                         'Licitação Item'       ,'Valor Total'          ,'Percentual'            ,'Valor Unitário'            ,
                                         'Fábrica'              ,'Empresa de Pequeno Porte','Micro Empresa'      ,'Certidão Negativa de Débitos Trabalhistas',
                                         'Solicitação'          ,'Fábrica'              ,'Autorização para Impressão de Documentos Fiscais', 'Nota Fiscal'   ,
                                         ''                     ,'Solicitação'          ,'Solicitação Item'      ,'Publicação'                ,
                                         'Vigência'             ,'Cadastro Funcionário' ,'Vende'                 ,'Previdência'               ,
                                         'Tipo de Folha'        ,'Identidade'           ,'Categoria Trabalhista' ,'Profissão'                 ,
                                         'Funcionário'          ,'Ocorrência'           ,'Arrendondamento'       ,''                          ,
                                         ''                     ,''                     ,''                      ,''                          ,
                                         ''                     ,''                     ,''                      ,''                          ,
                                         ''                     ,''                     ,''                      ,''                          ,
                                         ''                     ,''                     ,'Documento'             ,'Salário Família'           ,
                                         'Salário Família'      ,'Situação'             ,'Data'                  ,'Aquisição'                 ,
                                         'Tipo'                 ,'Ultímo'               ,'Carterira de motorista','Vencimento'                ,
                                         'Orçamento'            ,''                     ,'Hora Abastecimento'    ,'Ordem Reforma'             ,
                                         'Responsável'          ,'Fabricação'           ,'Veículo'               ,'Combustível'               ,
                                         'Apensados'            ,'Assunto'              ,'Documento Produto'     ,'Tramite'                   ,
                                         'Principal'            ,'Caminho'              ,'Providência'           ,'Código'                    ,
                                         'Manutenção'           ,'Quantidade'           ,'Homologação'           ,'Habilitação'               ,
                                         ''                     ,'Licitação'            ,'Convênio'              ,'Subfunção'                 ,
                                         'Orgão'                ,'Função'               ,'Ação'                  ,'Orçamentária'              ,
                                         'Endereço'             ,'Agência'              ,'Orçamento'             ,'Unitário'                  ,
                                         'Índice'               ,'Apropriação'          ,'Líquido'               ,'Classificação'             ,
                                         'Orçado'               ,'Homologação'          ,''                      ,'Legislação'                ,
                                         'Intraorçamentário'    ,'PPA'                  ,'Até'                   ,'Total'                     ,
                                         'Aplicação'            ,'Referência'           ,'Diferênça'             ,'LRF'                       ,
                                         'Nível'                ,'Orçada'               ,'veículo'               ,'Série'                     ,
                                         'Inclusão'             ,'Movimentação'         ,'Divisão'               ,'Situacão'                  ,
                                         'Admissão'             ,'Demissão'             ,'Padrão'                ,'Valor Incidi INSS Normal'  ,
                                         'Instituto'            ,'IRRF'                 ,'CPF'                   ,'CNPJ'                      ,
                                         'Décimo Terceiro 13º'  ,'Previsão'             ,'Abono Férias'          ,'Descrição'                 ,
                                         'Médico'               ,'PIS'                  ,'Aposentado'            ,'Aposentado'                ,
                                         'Após'                 ,'Hora'                 ,'Admitido'              ,'Afastado'                  ,
                                         'Trabalho'             ,'Ativo'                ,'Tipo Moeda'            ,'Nomeacao'                  ,
                                         'Código Secretaria'    ,'Nome Secretaria'      ,'Observacões'           ,'INSS'                      ) ;   
 {$endregion}

var txt: String;
var arrayStr : Array of string;
var i,ii,iii : Integer;
var boo      : Boolean;

Begin
  SetLength(arrayStr,100);

  i      := 0;
  ii     := 0;
  iii    := 0;


 // Retira os Underlines "_", e Jogar os tranformados para os array's

   while Pos( '_',strNomeView) > 0 do
   begin
     arrayStr[i]:= Copy(strNomeView,1,Pos('_',strNomeView)-1);
     Delete(strNomeView,1,Pos('_',strNomeView));
     Inc(i);
   end;

   arrayStr[i]:= strNomeView;
   boo := False;
   // Vai passar os prefixos para os nomes certos ...
   for ii := 0 to i do
   Begin
     Application.ProcessMessages;
     for iii := 0 to total_array do
     Begin
       if UpperCase(arrayStr[ii]) = UpperCase(arrayPrefixo[iii]) then
       Begin
         arrayStr[ii]:= arrayNomes[iii];
         boo:= True;
         break;
       end;
     end;
     // Primeira letra maiúscula da cadeia de String...
     if not(boo) then
     Begin
       arrayStr[ii] := UPPERCASE(Copy(arrayStr[ii], 1, 1)) + LowerCase(Copy(arrayStr[ii], 2, Length(arrayStr[ii])));
     end;
     boo := False;

     Application.ProcessMessages;
    end;

   result := '';

   for ii := 0 to i do
   Begin
    result := result + arrayStr[ii] + ' ';
   end;
  end;
Begin

  /// Leia  o comentário da Função ProcuraPrefixo
  /// antes de alterar qualquer coisa, por favor ..........................
  /// Funções feitas por João Bosco dos Reis Becker & Eduardo José Effgen,
  /// funções usadas nos dicionários de Dados.
  /// Antes
  /// Ex :  cod_pano_conta
  /// Depois
  /// Ex :  Código Plano Conta
  /// Functions Feitas em : 18/10/2015 }


  Result := ProcuraPrefixo; //Percores os Array's em procura do prefixo do campo, e o altera com o nome referente ao Prefixo EX: "cod_emp" se terna - "Código Empresa"
  Result := TrimRight(TrimLeft(Result)); // Retira os espaços da Direita e da Esquerda.
  Result := StringReplace(Result,'  ',' ',[rfReplaceAll ]); // Retira Dois espaços e coloca apenas Um.
  Result := funTroca(Result);   // Trás o campo com as primeiras letras em maiúsculo EX : João Bosco
end;2,0
