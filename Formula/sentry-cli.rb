class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.58.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.58.1/sentry-cli-Darwin-universal"
    sha256 "d7fdd13384ce6ac1475db1cf49de2dad2012b598b5e581ee9fc30eebcd9e94ce"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.1/sentry-cli-Linux-aarch64"
        sha256 "a4f83670b82b50a2e19f7977c3662b9c2590f919b0ead9800e00202021035b95"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.1/sentry-cli-Linux-armv7"
        sha256 "7cbd069b5fc2d4931288ef9021ff8f378b52134ca0d4f2de3d96553955fcc69a"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.1/sentry-cli-Linux-x86_64"
        sha256 "f8572d045821911ac54a03c2fd94597c22655fd82df11e6734acbfef18945935"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.58.1/sentry-cli-Linux-i686"
        sha256 "cd8863733d1fd28cda778c207a4e2ebdee151a87d009544b8b620d5b8b4a5047"
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
