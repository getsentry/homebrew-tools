class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.28.5"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.28.5/sentry-cli-Darwin-universal"
    sha256 "21dcd0d50cade650578d54e94965c4da0cc3c3c21a0a352dc17d76b4f51465f5"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.5/sentry-cli-Linux-aarch64"
        sha256 "5bc6646bf4dcf6de3406e2b17e83f6602dce506ce809d2778448fe26ed23a64d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.5/sentry-cli-Linux-armv7"
        sha256 "f504c05273c5be0a289fa1dfe4b3ee49bfd06be63ea4bfb1084be382c191f7b8"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.5/sentry-cli-Linux-x86_64"
        sha256 "76697ea25422a2fa3e9aa1f64a22f0901b5c0a74bcfc0dbf4510fa66a9c146a4"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.5/sentry-cli-Linux-i686"
        sha256 "5f5365caa0ec739db415df2f3244cd48b25cede275bf39651aa4acf29c2af3a2"
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
