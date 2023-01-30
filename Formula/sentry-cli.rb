class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.12.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.12.0/sentry-cli-Darwin-universal"
    sha256 "b78bb9a567d379577091cfc860af0ad3734b694cc338c042ade7ba57ad0b34b5"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.12.0/sentry-cli-Linux-aarch64"
        sha256 "4b9e88a1925dd09c706c2263d2d671682bc4b2f146f2ee12670ec7fe6cd51f1d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.12.0/sentry-cli-Linux-armv7"
        sha256 "e30a93193d24d518e6483e930d0e099f995702030cc50a26bdecc62c1f3c5c4e"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.12.0/sentry-cli-Linux-x86_64"
        sha256 "ab6723a84675bc7d11bbf4f723511150af0c58e10c1c1dafb8210837d2a97673"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.12.0/sentry-cli-Linux-i686"
        sha256 "624aa49b839d052d95eba156ae465a459f4fb0d9509c7497909eec0bab2171db"
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
