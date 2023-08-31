class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.20.6"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.20.6/sentry-cli-Darwin-universal"
    sha256 "799e0c1c74a2e786009f208336c56e7c3172a9a93666de9cadfa9c16dff06cfa"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.6/sentry-cli-Linux-aarch64"
        sha256 "ab1d82b6eedf57527cb56d3ec2752f5ebc035e351895d966de4000f0d255a230"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.6/sentry-cli-Linux-armv7"
        sha256 "95aedc6d680629d613d399ccceb895a85fbcd357c11013853e3abce8df6b9439"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.6/sentry-cli-Linux-x86_64"
        sha256 "043c1480ede8e8e093070fa705e2723b2b556763e5c10eaa020e3923fad2da20"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.6/sentry-cli-Linux-i686"
        sha256 "620a40053d12059fb24cd79391612a360de50822b2630342618f5078fe33848a"
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
