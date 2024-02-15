if ENV["CORS_ORIGINS"].present?
  Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins(*ENV.fetch("CORS_ORIGINS", "").split(","))

      resource "*",
        headers: :any,
        methods: %i[get post put patch delete options head]
    end
  end
end
