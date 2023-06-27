class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.19.4"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.19.4/sentry-cli-Darwin-universal"
    sha256 "f513a4d6878f41d788898b212731a4755f89c76cf27b961d44feec8b456d840f"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.4/sentry-cli-Linux-aarch64"
        sha256 "ea0021c6c69cf91c7050be105b8faa40d29c252b6d8c63d2aa33460196a41897"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.4/sentry-cli-Linux-armv7"
        sha256 "6349618bf0c838c7f611ccc93c4fb1abc02b0396541d54a93a87e1e7d83e761c"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.4/sentry-cli-Linux-x86_64"
        sha256 "a9fb79e44c5bae6ca8dfd2c66ac918c7e0405e3456edeb100d698961842f057f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.19.4/sentry-cli-Linux-i686"
        sha256 "0bf706665ea0f5a5bad751a405895913f66cbc65cbae0c988be8c2996b422972"
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
