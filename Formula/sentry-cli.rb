class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.43.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.43.0/sentry-cli-Darwin-universal"
    sha256 "fe081198ff0717147db4f1947c63b90481c5130ae0500dfe40db6c0e52364950"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.43.0/sentry-cli-Linux-aarch64"
        sha256 "15a596b0ab099c5e42d779e46b76624064a460d6f12bd792af508a5abcd1d293"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.43.0/sentry-cli-Linux-armv7"
        sha256 "b98c772fdd1a1258aa1e3cb7671c85fae90ccaeb1381605a0d5ebb38a9c1d6a9"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.43.0/sentry-cli-Linux-x86_64"
        sha256 "d9b5d6f98678cbd2d8fe1ade321125cb3a4baaa20463f72f0dc61083184ac85b"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.43.0/sentry-cli-Linux-i686"
        sha256 "3489497ae897e345b21ae0c1928419f58c8df4b5e2cfdb06ca49b225378dbd7d"
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
