class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.37.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.37.0/sentry-cli-Darwin-universal"
    sha256 "6eb56b44c4c003d7fc1ad924944ef7cb1ad4fabcaed0aceffa1bf70a4b57d6fe"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.37.0/sentry-cli-Linux-aarch64"
        sha256 "801c3d783f8665200029f35edf2f7228e011cd3a154604c64382bf8d1bfa31e4"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.37.0/sentry-cli-Linux-armv7"
        sha256 "de78373a1ff895847db76676bf93838a9f9de072adbbefe81ed1105ff679773f"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.37.0/sentry-cli-Linux-x86_64"
        sha256 "91453d7eec5a8d02f5e2cc216e811e147f5019b8877bfc3fb8f9dcc1ea80f086"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.37.0/sentry-cli-Linux-i686"
        sha256 "a87d7dd0d3d9df3f60b7491fe995afd77c00b4334a70b5283172801da83a3150"
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
