class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.13.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.13.0/sentry-cli-Darwin-universal"
    sha256 "549400349cddc29122373c2a166f3ea3723e309eac3690c66543924d9d638bd3"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.13.0/sentry-cli-Linux-aarch64"
        sha256 "01b39b3dd502d532846b741e612a1796ce727b79bb69cbab45b23126507717f8"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.13.0/sentry-cli-Linux-armv7"
        sha256 "85750995d28f7a0771f6f6a9fe23197dc35512047afc3c78bb042613d41aea8f"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.13.0/sentry-cli-Linux-x86_64"
        sha256 "217bcb4e5fd74b189be5a834ba835828eb6f7d97d3f676ef2da26f4de3df1729"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.13.0/sentry-cli-Linux-i686"
        sha256 "05e52e80408ad1e513cdc2e6732486331bfdc122951478a91f44c6652b282cf7"
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
