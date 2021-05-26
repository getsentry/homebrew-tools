class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.65.0"
  license "BSD-3-Clause"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.65.0/sentry-cli-Darwin-universal"
    sha256 "e7556bae5ec35e6060a9210f815eb686b43f060bef1da028292daa0039160782"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.65.0/sentry-cli-Linux-aarch64"
        sha256 "b6343bd9a6dd2bd8dbbbc3eb20513b21635c6c312693ac9fedb966dea45cead1"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.65.0/sentry-cli-Linux-armv7"
        sha256 "19c1ad6b913fd20c726293fccb62b3563ed1499819cfc13efeac89ef83e53058"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.65.0/sentry-cli-Linux-x86_64"
        sha256 "95d27ee9e29ad95677bd71dca20c8e3d6369631d0495717b5d2a66be45d6a12d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.65.0/sentry-cli-Linux-i686"
        sha256 "a70d818872b91a62f4782ab5f1a3eb52b3556e5b46c3239a819b14af8f2fb865"
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
