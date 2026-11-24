class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.51.0"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.51.0/sentry-darwin-arm64.gz"
      sha256 "44cf1f958d59b97c7bd8bbc43ad53ea670099cfe6a19f82a140c54638e7acf9a"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.51.0/sentry-darwin-x64.gz"
      sha256 "08aca13a263eb57ca2dc06f0c790f4228b185da33c2804ed21352292c67d3ecf"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.51.0/sentry-linux-arm64.gz"
      sha256 "5d51f8aac2d372ddbe52297fdd7eb0bfd8757a8a0f99a53a4860a1ac6dcd3637"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.51.0/sentry-linux-x64.gz"
      sha256 "6a29c3f4147f213e276003927a30d05cbb64dd5ee9d87b487debc38df9354b80"
    else
      raise "Unsupported Linux CPU architecture: #{Hardware::CPU.type} (only 64-bit arm and x86_64 are supported)"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install Dir["sentry-*"].first => "sentry"
    # The release asset is a bare gzip, so the unpacked binary has no
    # exec bit. Homebrew's cleaner only fixes that after `install`.
    chmod 0755, bin/"sentry"
    # Homebrew-managed completion dirs survive the build sandbox and
    # are cleaned up by `brew uninstall`. Writing into $HOME from
    # post_install does not work: it runs under a throwaway HOME.
    generate_completions_from_executable(bin/"sentry", "cli", "completion")
  end

  def caveats
    <<~EOS
      Shell completions for bash, zsh, and fish are installed by Homebrew.

      To install the Sentry CLI skill for detected AI coding agents, run:
        sentry cli setup --no-modify-path --no-completions

      `sentry cli upgrade` refreshes the skill automatically. After a
      `brew upgrade`, run the command above again.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry --version").chomp
  end
end
