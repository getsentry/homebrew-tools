class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.12.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.12.0/sentry-darwin-arm64.gz"
      sha256 "8bfc9539c7f9601e719bd1f288df10502bb68c31c8e92112cf0728ee5ddab47f"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.12.0/sentry-darwin-x64.gz"
      sha256 "238ef8117db325ab0c39a2039e67dd4efb5e886be4415301b0b3179f870251e4"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.12.0/sentry-linux-arm64.gz"
      sha256 "47ecbe793d37b62ac49bab08df40d5c3e27df2f2b6f2c08093c5a5eaac3d8daf"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.12.0/sentry-linux-x64.gz"
      sha256 "66490a04184e90366f692bb1010242a434ea15aa74142d75223b2ac694a333ad"
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
