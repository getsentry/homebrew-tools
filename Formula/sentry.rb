class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.28.1"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.28.1/sentry-darwin-arm64.gz"
      sha256 "1676dc79ac99b4c3ecf28712b2bb5d49704e187786a41bc065edc13f8c20e4cc"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.28.1/sentry-darwin-x64.gz"
      sha256 "5eab3b14581b0b47bfbdce79a5ff6b5a43001c347cbf2251c4d942c3b32282b0"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.28.1/sentry-linux-arm64.gz"
      sha256 "7f828858e2b3f0a0ca3640e55b73962a2149427079b9caa9588c35293b8ebb40"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.28.1/sentry-linux-x64.gz"
      sha256 "99fe53c3c897aaea4c66240cea2e9c779499162b1a39efdec7ce3fa9e6104d91"
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
