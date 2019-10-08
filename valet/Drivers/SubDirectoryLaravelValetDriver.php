<?php

class SubDirectoryLaravelValetDriver extends LaravelValetDriver
{
    /**
     * Determine if the driver serves the request.
     *
     * @param string $sitePath
     * @param string $siteName
     * @param string $uri
     *
     * @return bool
     */
    public function serves($sitePath, $siteName, $uri)
    {
        return parent::serves(
            $this->extractPathFromUri($sitePath, $siteName),
            $siteName,
            $uri
        );
    }

    /**
     * Determine if the incoming request is for a static file.
     *
     * @param string $sitePath
     * @param string $siteName
     * @param string $uri
     *
     * @return string|false
     */
    public function isStaticFile($sitePath, $siteName, $uri)
    {
        return parent::isStaticFile(
            $this->extractPathFromUri($sitePath, $siteName),
            $siteName,
            $uri
        );
    }

    /**
     * Get the fully resolved path to the application's front controller.
     *
     * @param string $sitePath
     * @param string $siteName
     * @param string $uri
     *
     * @return string
     */
    public function frontControllerPath($sitePath, $siteName, $uri)
    {
        return parent::frontControllerPath(
            $this->extractPathFromUri($sitePath, $siteName),
            $siteName,
            $uri
        );
    }

    /**
     * Serve the static file at the given path.
     *
     * @param  string  $staticFilePath
     * @param  string  $sitePath
     * @param  string  $siteName
     * @param  string  $uri
     * @return void
     */
    public function serveStaticFile($staticFilePath, $sitePath, $siteName, $uri)
    {
        return parent::serveStaticFile(
            $staticFilePath,
            $this->extractPathFromUri($sitePath, $siteName),
            $siteName,
            $uri
        );
    }

    protected function extractPathFromUri($sitePath, $siteName)
    {
        $parts = explode('.', $siteName);

        array_pop($parts);

        return $sitePath . '/' . implode('/', $parts);
    }
}

