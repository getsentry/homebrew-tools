class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.28.6"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.28.6/sentry-cli-Darwin-universal"
    sha256 "642160062d1873e41828c26cddd30065358f33613bcd1152df31d1e95839a67c"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.6/sentry-cli-Linux-aarch64"
        sha256 "de763704846669f2b8345327333850aecea372310f573aa5838d5868b5ffb681"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.6/sentry-cli-Linux-armv7"
        sha256 "c37a6c4fbb5c7f0c3a02c608d71753396a041de1188add6241588022a1c3650d"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.6/sentry-cli-Linux-x86_64"
        sha256 "790c1c4a0e59112d25b8efdf00211881851f4f33443c4e885df336d16b88b457"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.28.6/sentry-cli-Linux-i686"
        sha256 "4ba889f03d984628cd41d3957ef779b43a262b3eefd30d57469c517c7ffb7eb2"
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
