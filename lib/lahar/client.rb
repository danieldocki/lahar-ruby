module Lahar
  #
  # Mais informações em http://ajuda.lahar.com.br/integracoes
  #
  class Client
    include HTTParty

    def initialize(token, event="integration")
      @event = event
      @token = token
    end

    #
    # A hash do Lead pode conter os seguintes parâmetros:
    # (obrigatório)  :email_contato
    # (obrigatório)  :nome_formulario (use para converter em um evento)
    #                :nome_contato
    #                :sobrenome
    #                :nome_empresa
    #                :cargo
    #                :site_empresa
    #                :site_contato
    #                :setor
    #                :tel_fixo
    #                :tel_empresa
    #                :email_empresa
    #                :tel_celular
    #                :anotacoes
    #                :tags
    #                :twitter
    #                :facebook
    #                :twitter_empresa
    #                :facebook_empresa
    #                :linkedin
    #                :cidade
    #                :estado
    #                :endereco_empresa
    # Caso algum parâmetro não seja identificado como campo padrão ou como
    # campo personalizado, este parâmetro desconhecido será ignorado.

    def create_lead(lead_hash)
      lead_hash = token_hash.merge(lead_hash)
      lead_hash = lead_hash.merge(event_hash) unless lead_hash.has_key?(:nome_formulario)
      post_with_body("/conversions", { :body => lead_hash })
    end
    alias_method :change_lead, :create_lead


    # param lead_hash:
    #   Hash contendo:
    #     :estagio_lead
    #       1 - Lead; 2 - Oportunidade; 3 - Cliente

    def change_lead_status(lead_hash)
      lead_hash = token_hash.merge(lead_hash)
      put_with_body("/leads", :body => lead_hash.to_json, :headers => { 'Content-Type' => 'application/json' })
    end

    private

    def base_url
      "https://app.lahar.com.br/api"
    end

    def token_hash
      { :token_api_lahar => @token }
    end

    def event_hash
      { :nome_formulario => @event }
    end

    def post_with_body(path, opts)
      self.class.post("#{base_url}#{path}", opts)
    end

    def put_with_body(path, opts)
      self.class.put("#{base_url}#{path}", opts)
    end
  end
end
