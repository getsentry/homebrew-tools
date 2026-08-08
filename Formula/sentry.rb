class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.42.2"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.42.2/sentry-darwin-arm64.gz"
      sha256 "e144355bdf3a527ed313afc1552f8dbbf8a72b686479535c4803bb98c7a2b3f1"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.42.2/sentry-darwin-x64.gz"
      sha256 "938538b0f8f3120597aa2ea7ef1042508b7716760369a39404dd00842288ff98"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.42.2/sentry-linux-arm64.gz"
      sha256 "ac7e2aba35e7909fd61d5122fff30fc7a9cd2474ff33e1448ed350f4b89ad315"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.42.2/sentry-linux-x64.gz"
      sha256 "65c19a006ba6440cd1e641eb74c8697a3afb6a213a2ad64b73a03ba75799fe10"
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
