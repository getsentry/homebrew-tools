class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.30.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.30.1/sentry-cli-Darwin-universal"
    sha256 "56aaaa929871511923115c93a16074fa48efea94be80f0e6ffe56ee65b905599"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.1/sentry-cli-Linux-aarch64"
        sha256 "11dee7f6459245d8cedbce4139342b89d24759bba7a90205be4e4b9cbdd2b7e5"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.1/sentry-cli-Linux-armv7"
        sha256 "044fd1dd9c5fde9c04156f0cce1476b861bc1a96270a08eba58ab642a1d9edff"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.1/sentry-cli-Linux-x86_64"
        sha256 "35ccca7cf53e2b7cd5f76311b43315f3267ee123af0184671cca6746c7499b10"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.1/sentry-cli-Linux-i686"
        sha256 "b9da2382d71673b9d221690013be07b15dd7030a30bd66b3701eccd1c9d058fb"
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
