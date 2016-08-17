use Rack::Static,
  :urls => ["/images", "/js", "/css"],
  :root => "public"

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    if env['PATH_INFO'] == "/happy-birthday"
      File.open('public/happy-birthday/index.html', File::RDONLY)
    else
      File.open('public/index.html', File::RDONLY)
    end
  ]
}
