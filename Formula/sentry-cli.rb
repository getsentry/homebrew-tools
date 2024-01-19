class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.77.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.77.3/sentry-cli-Darwin-universal"
    sha256 "6d88b76f393e2e7d28fdd47e38b967b120cffd63c23f9bcf957bd9649249d819"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.3/sentry-cli-Linux-aarch64"
        sha256 "f36e03cfcf93eebc73c93ebf9772afc34bca30ca70e808d964d0e44b7a63c425"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.3/sentry-cli-Linux-armv7"
        sha256 "ab1d464c92713b06f9156014ac0c075d179aa227416e99a2602ecadce7350ab7"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.3/sentry-cli-Linux-x86_64"
        sha256 "3188668e55aad1fec58d13ca695d2c31131ba90f30ea39885778cfba64429288"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.3/sentry-cli-Linux-i686"
        sha256 "ba52347c977fb6d2124fd188da5d3b6c54de59dc98036c27a24f1e7666fe6606"
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
