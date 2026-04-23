class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.29.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.29.0/sentry-darwin-arm64.gz"
      sha256 "839ba557ff44a9375bae3017584ff1dbbc7c9def777113d9764f810d43397a60"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.29.0/sentry-darwin-x64.gz"
      sha256 "98a0c15cc84e65450830c661bf5b9baf655f70f76d8f522872709f7308557882"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.29.0/sentry-linux-arm64.gz"
      sha256 "8a895637d9a3776fa6ec5146e20b702d3463f1406c626a731dada34d6e735c3e"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.29.0/sentry-linux-x64.gz"
      sha256 "6bfd0a212bd9087ea35715abfb260f8098121ddd10efadb58033115a6b4d6edd"
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
