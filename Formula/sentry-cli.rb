class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.52.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.52.0/sentry-cli-Darwin-universal"
    sha256 "d2e49a13bc253044dd8bc4bc822ca255ad8b3353488378e6ded1d5483cfad835"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.52.0/sentry-cli-Linux-aarch64"
        sha256 "1db6a70093828bd3a017f585a2717e83ffb01f2aee671900669ae49de5261c4f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.52.0/sentry-cli-Linux-armv7"
        sha256 "befa94bb905487b58c7914ccd8ab137407b782f45b7d3ceb2f269fc94375e4c7"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.52.0/sentry-cli-Linux-x86_64"
        sha256 "6149cf765590ef5adf2e8bc47ca236ba9100b38d600dd148b3bc435693c7e6a5"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.52.0/sentry-cli-Linux-i686"
        sha256 "31fdaaa50835b1604bfbe43ea1fd8870acf336d70cf9f56250075f85971fb261"
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
