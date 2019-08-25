<?php
namespace My\Log\Controller\Index;

use Magento\Framework\App\Action\Action;
use Magento\Framework\App\Action\Context;
class Index extends Action
{
    /**
     * Logging instance
     * @var \My\Log\Logger\Logger
     */
    protected $_logger;
    /**
     * @param Context $context
     * @param PageFactory $resultPageFactory
     */
    public function __construct(
        Context $context,
        \My\log\Logger\Logger $logger
    ) {
        $this->_logger = $logger;
        parent::__construct($context);
    }
    /**
     * Default customer account page
     *
     * @return \Magento\Framework\View\Result\Page
     */
    public function execute()
    {
        $this->_logger->info("Some text string data"); // log string Data to customfile.log
        //  Write Your Code Here
        echo "custom log file has been created please check customlog.log file in path var/log";
        die();
    }
}