class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.50.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.50.0/sentry-cli-Darwin-universal"
    sha256 "fa057524abbbd85e960960c5520074837bea11aa7c09602f1489c24728e24d45"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.50.0/sentry-cli-Linux-aarch64"
        sha256 "d9bc23158a30b4987dfc36494375aa86f1adcf1fb3dd2acb1245d3a4fae4179c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.50.0/sentry-cli-Linux-armv7"
        sha256 "970f08daed2654ea6733609ba4dbfbfc1b9beec630daf168f10dde57dea84d54"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.50.0/sentry-cli-Linux-x86_64"
        sha256 "89b1b1cd10c16d817a70ee5bb6673ccdcc48936648f6f281b8d576a3044430c9"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.50.0/sentry-cli-Linux-i686"
        sha256 "29a843be810a8987216ce46c41edffe2e21813999888a4bdf5034ed3223ba541"
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
