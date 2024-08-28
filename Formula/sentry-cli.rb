class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.34.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.34.0/sentry-cli-Darwin-universal"
    sha256 "6704130938b41b914d6dc3fb99130f860062a0e1fbb7870b178c5c842c85ed45"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.34.0/sentry-cli-Linux-aarch64"
        sha256 "0e739e82848388f3319a506840ddada4b8d47a6ffcb12c9d70c588e3b037894c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.34.0/sentry-cli-Linux-armv7"
        sha256 "eb8372143ce3a969e41f43c015f8cd0ac59237adf2d95083b2c5a49a1ec5e83f"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.34.0/sentry-cli-Linux-x86_64"
        sha256 "13b9338a927a6826ba455699dc0615678918a631c48e72b204fa7b65adb7d032"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.34.0/sentry-cli-Linux-i686"
        sha256 "a2415db0edd7210a7325f1c63ba9c2b4221babf9684de16702bc24777ec940c0"
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
