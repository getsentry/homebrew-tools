class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.23.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.23.1/sentry-cli-Darwin-universal"
    sha256 "21af0cd6375e7b0686b5d4808ea6035b0eaf8b5c64b8e024f7da87ec2aa986a3"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.23.1/sentry-cli-Linux-aarch64"
        sha256 "c780829bef1e4f3fde18f51adc747f4497077677289bae07bf1c0427ba9c1196"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.23.1/sentry-cli-Linux-armv7"
        sha256 "0e95c542dac19cd4077e20f506be0bec9a56dccd0dd08849ad63bf6cb77644e2"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.23.1/sentry-cli-Linux-x86_64"
        sha256 "e01de8640c4f7c19c8e9670d0269528beccbf196b2be32f9380b3f69eea51ac8"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.23.1/sentry-cli-Linux-i686"
        sha256 "6879f208ab9bde5417a5c1fa9ba113ed9ebaae4f3ee800c4155ff8dba9e2a82e"
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
