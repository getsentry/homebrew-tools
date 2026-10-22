class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.8.2"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.8.2/sentry-cli-Darwin-universal"
    sha256 "2d1b118fa46960ba5e8e0cca9a6e197366905776a0ddc5a89c7d05a3908b77db"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.8.2/sentry-cli-Linux-aarch64"
        sha256 "b6e49fca868a36d20da2ada1832a0ce2f9ac7012c128207518b09d6b6c991f4d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.8.2/sentry-cli-Linux-armv7"
        sha256 "10a5c414e298c5ad660eb8dbafde19c28ab1e03d35653cd59dbed35b9e1b05e5"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.8.2/sentry-cli-Linux-x86_64"
        sha256 "c958865f9d4000183509ea21b1f04925d5390de6d8d87386b9e69f2b305070c3"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.8.2/sentry-cli-Linux-i686"
        sha256 "eebb53cf4a0ebcbb526c269c189909d61f28a91e4de0f139a96e25552dcf9eec"
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
