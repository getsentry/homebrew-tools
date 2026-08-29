class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.44.1"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.44.1/sentry-darwin-arm64.gz"
      sha256 "0dff9bbda8aaebb9d43fc1ea6dbc0d609a4110a435d361f0ee2fbb89c856f129"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.44.1/sentry-darwin-x64.gz"
      sha256 "1ff784480213fcbb818c2c9e1772ae249fdd9fa62ab0f8dd681f47f850e6dc9b"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.44.1/sentry-linux-arm64.gz"
      sha256 "7705338fc8bc62edc68d6baf033024e3685477a1421e25492c1f82e52136080f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.44.1/sentry-linux-x64.gz"
      sha256 "5f0730824c27474322c5136a74776ae8e088bd3a96675da89c5d49008310a3ab"
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
