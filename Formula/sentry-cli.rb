class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.58.6"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.58.6/sentry-cli-Darwin-universal"
    sha256 "728d5a8c48d3e94d0a3e644431dcaad19c28b126a00eb37930e67bd146905d96"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.6/sentry-cli-Linux-aarch64"
        sha256 "79e60095ab461eac70c23ce750499bff5c6bffb95d364ccf38d3259557403987"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.6/sentry-cli-Linux-armv7"
        sha256 "a935540e64dc0b73e169a39034975ae326862b517739dc3e6adc7f9d0b47a657"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.6/sentry-cli-Linux-x86_64"
        sha256 "36b689311b399d9332950d84f4299aee682d2d290a770a77372b30a74f7e7add"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.6/sentry-cli-Linux-i686"
        sha256 "d523b7d6e1898be929aaf7f10326e3f851acf4c434bc1bc9c0c9bb6c19d740e3"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
