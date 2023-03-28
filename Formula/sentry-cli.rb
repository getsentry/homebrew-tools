class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.16.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.16.1/sentry-cli-Darwin-universal"
    sha256 "2656c27ebb037fcc19f1131baf96c8269d9f8419f6b7e681aa2478acb72df3f4"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.16.1/sentry-cli-Linux-aarch64"
        sha256 "8a99a355cc22aa6b6c771fa3a7b16dd662b4d2f611597b3079a59c694611559a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.16.1/sentry-cli-Linux-armv7"
        sha256 "6ba45a99e99c4061be6028f39d4f89d323af119f0bbc4ece0373bb06944d0b60"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.16.1/sentry-cli-Linux-x86_64"
        sha256 "ecf31e820f563471b4266e25e4e0dcf4ee2e80587b2b07fea498113df801a8c3"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.16.1/sentry-cli-Linux-i686"
        sha256 "a42c677a8d6b50497e921dc104a3ebdf505dca371f089511092d074479397fde"
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
