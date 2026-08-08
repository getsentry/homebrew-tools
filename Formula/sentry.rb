class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.42.1"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.42.1/sentry-darwin-arm64.gz"
      sha256 "4df89cfb7a893f42474d3990f2a72d4d889a467d6cbe53c59a9e57d6dc566236"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.42.1/sentry-darwin-x64.gz"
      sha256 "1f84871b9a511971cb60170c571bc147007432090fb615aaafca002a14637da1"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.42.1/sentry-linux-arm64.gz"
      sha256 "f832e2dc8d7f2b995a72c37905c42ed7f557194e80ea3cd42713d5c41682e68d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.42.1/sentry-linux-x64.gz"
      sha256 "f6cab4b85c6e91a70c4f24ca85b4eafe002b8e46397b23b651f6da47ed0eb67f"
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
