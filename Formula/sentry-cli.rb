class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.27.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.27.0/sentry-cli-Darwin-universal"
    sha256 "8693527282890285f55d9b55414905e8621dd788ad3ae4c85175b84e8eeb6a04"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.27.0/sentry-cli-Linux-aarch64"
        sha256 "54fce909d18c815cb41a3fd24088b76b58872326f211e18ee28646ae844882b0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.27.0/sentry-cli-Linux-armv7"
        sha256 "7fbc79ea7d90aa39acf7e0cdd66535258494ef981401ce37c477b42393505b79"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.27.0/sentry-cli-Linux-x86_64"
        sha256 "6b31bbd385d436620415305c12ae181c38bdd3a54c243803dc3ff241ee952356"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.27.0/sentry-cli-Linux-i686"
        sha256 "85012ec0e55593a4d0f7b413a209033b0ff45a790a4bd962aed7d491dc025d4c"
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
