class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.37.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.37.0/sentry-darwin-arm64.gz"
      sha256 "a5d60afffc98582e76b64b9cf1502054610639b5cea0c78a865e718717713f74"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.37.0/sentry-darwin-x64.gz"
      sha256 "716c270d47e5082238b08443a88de1e67fec597bb1a4a7e032d3cebfbb7e9141"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.37.0/sentry-linux-arm64.gz"
      sha256 "63c104fec8e4d54a4db97d61cfd07a677e2b516310c468279d45d10b26833368"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.37.0/sentry-linux-x64.gz"
      sha256 "38cd75ca73765bb1a01824c4f55c4f22717939aa1a7b39f08ef6ea83074cd5fb"
    else
      raise "Unsupported Linux CPU architecture: #{Hardware::CPU.type} (only 64-bit arm and x86_64 are supported)"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install Dir["sentry-*"].first => "sentry"
  end

  def post_install
    system bin/"sentry", "cli", "setup", "--method", "brew", "--no-modify-path"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry --version").chomp
  end
end
