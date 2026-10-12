$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$rootPrefix = $root.TrimEnd('\') + '\'
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add('http://localhost:8000/')
$listener.Start()

$contentTypes = @{
  '.html' = 'text/html; charset=utf-8'
  '.css'  = 'text/css; charset=utf-8'
  '.js'   = 'text/javascript; charset=utf-8'
  '.json' = 'application/json; charset=utf-8'
  '.svg'  = 'image/svg+xml'
  '.jpg'  = 'image/jpeg'
  '.jpeg' = 'image/jpeg'
  '.png'  = 'image/png'
}

Write-Host 'Website erreichbar unter http://localhost:8000/ (Beenden mit Ctrl+C)'

try {
  while ($listener.IsListening) {
    $context = $listener.GetContext()
    $response = $context.Response

    try {
      $relativePath = [Uri]::UnescapeDataString($context.Request.Url.AbsolutePath.TrimStart('/'))
      if ([string]::IsNullOrWhiteSpace($relativePath)) {
        $relativePath = 'index.html'
      }

      $filePath = [IO.Path]::GetFullPath((Join-Path $root $relativePath))
      if (-not $filePath.StartsWith($rootPrefix, [StringComparison]::OrdinalIgnoreCase)) {
        $response.StatusCode = 403
      } elseif (-not (Test-Path -LiteralPath $filePath -PathType Leaf)) {
        $response.StatusCode = 404
      } else {
        $extension = [IO.Path]::GetExtension($filePath).ToLowerInvariant()
        if (-not $contentTypes.ContainsKey($extension)) {
          $response.StatusCode = 415
        } else {
          $bytes = [IO.File]::ReadAllBytes($filePath)
          $response.ContentType = $contentTypes[$extension]
          $response.ContentLength64 = $bytes.Length
          $response.OutputStream.Write($bytes, 0, $bytes.Length)
        }
      }
    } catch {
      Write-Error "Fehler beim Ausliefern von $($context.Request.Url.AbsolutePath): $_"
      $response.StatusCode = 500
    } finally {
      $response.Close()
    }
  }
} finally {
  $listener.Stop()
  $listener.Close()
}
