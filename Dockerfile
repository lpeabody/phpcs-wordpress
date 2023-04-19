FROM composer:2

ENV PATH="$COMPOSER_HOME/vendor/bin:${PATH}"

ARG WPCS_VERSION=2.3.0

# Add dependencies.
RUN composer global config --no-plugins allow-plugins.dealerdirect/phpcodesniffer-composer-installer true && composer global require wp-coding-standards/wpcs:${WPCS_VERSION}

# Configure PHPCS.
RUN phpcs --config-set installed_paths $COMPOSER_HOME/vendor/wp-coding-standards/wpcs

CMD ["phpcs"]
